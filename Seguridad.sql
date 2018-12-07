--SEGURIDAD--
--DUEÑO VETERINARIA--
CREATE OR REPLACE PACKAGE PA_DUEÑO_VETERINARIA
IS 
PROCEDURE adicionar_dueño(nombre VARCHAR, cedula NUMBER, telefono NUMBER, direccion VARCHAR, correo VARCHAR, fechaNacimiento DATE);
PROCEDURE adicionar_empleado(nombre VARCHAR, cedula NUMBER, telefono NUMBER, direccion VARCHAR, correo VARCHAR, fechaNacimiento DATE,cargo VARCHAR, horario VARCHAR,tipo VARCHAR);
PROCEDURE modificar_persona(Nnombre VARCHAR, Ncedula NUMBER);
PROCEDURE modificar_empleado(Ncedula NUMBER,Nhorario VARCHAR);
PROCEDURE adicionar_mascota(nombre VARCHAR,IDmascota NUMBER,tipoAnimal VARCHAR,raza VARCHAR,sexo VARCHAR,peso NUMBER,fechaNacimiento DATE,alergias VARCHAR,dueño NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY PA_DUEÑO_VETERINARIA
IS
   PROCEDURE adicionar_dueño(nombre VARCHAR,cedula NUMBER,telefono NUMBER,direccion VARCHAR,correo VARCHAR,fechaNacimiento DATE)IS
   BEGIN
   mantener_persona.adicionar_persona(nombre, cedula, telefono, direccion, correo, fechaNacimiento);
   mantener_persona.adicionar_dueño(cedula);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_dueño;
   
   PROCEDURE adicionar_empleado(nombre VARCHAR, cedula NUMBER, telefono NUMBER, direccion VARCHAR, correo VARCHAR, fechaNacimiento DATE,cargo VARCHAR, horario VARCHAR,tipo VARCHAR)IS
   BEGIN
   mantener_persona.adicionar_persona(nombre , cedula , telefono , direccion , correo , fechaNacimiento);
   mantener_persona.adicionar_empleado(cedula, cargo, horario);
   IF cargo = 'Veterinario' THEN
   mantener_persona.adicionar_veterinario(cedula,tipo);
   ELSIF cargo = 'Asistente' THEN 
   mantener_persona.adicionar_asistente(cedula,tipo);
   ELSIF cargo  = 'Cajero' THEN
   mantener_persona.adicionar_cajero(cedula);
   END IF;
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_empleado;
   
   PROCEDURE modificar_persona(Nnombre VARCHAR, Ncedula NUMBER) IS
   BEGIN
   mantener_persona.modificar_persona(Nnombre,Ncedula);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_persona;
   
   PROCEDURE modificar_empleado(Ncedula NUMBER,Nhorario VARCHAR) IS
   BEGIN
   mantener_persona.modificar_empleado(Ncedula,Nhorario);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_empleado;
   
   PROCEDURE adicionar_mascota(nombre VARCHAR,IDmascota NUMBER,tipoAnimal VARCHAR,raza VARCHAR,sexo VARCHAR,peso NUMBER,fechaNacimiento DATE,alergias VARCHAR,dueño NUMBER) IS
   BEGIN
   mantener_mascota.adicionar_mascota(nombre ,IDmascota ,tipoAnimal ,raza ,sexo ,peso ,fechaNacimiento ,alergias ,dueño);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END adicionar_mascota;
   
END PA_DUEÑO_VETERINARIA;
/
--CAJERO--
CREATE OR REPLACE PACKAGE PA_CAJERO
IS
PROCEDURE adicionar_solicitud(cajero NUMBER, dueño NUMBER,mascota NUMBER,servicio VARCHAR);
PROCEDURE adicionar_cita(fecha DATE, empleado NUMBER, solicitud NUMBER);
PROCEDURE adicionar_prestacionDeServicio(cita NUMBER, duracion NUMBER, materiales VARCHAR, observaciones VARCHAR);
END;
/

CREATE OR REPLACE PACKAGE BODY PA_CAJERO
IS
   PROCEDURE  adicionar_solicitud(cajero NUMBER, dueño NUMBER, mascota NUMBER, servicio VARCHAR) IS
   BEGIN
   registrar_solicitud.adicionar_solicitud(cajero, dueño, mascota);
   registrar_solicitud.adicionar_solicitudDeServicio(servicio);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_solicitud;
   
   PROCEDURE adicionar_cita(fecha DATE, empleado NUMBER, solicitud NUMBER)IS
   BEGIN
   registar_cita.adicionar_cita(fecha, empleado, solicitud);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_cita;
   
   PROCEDURE  adicionar_prestacionDeServicio(cita NUMBER, duracion NUMBER, materiales VARCHAR, observaciones VARCHAR)IS
   BEGIN
   registar_prestacionDeServicio.adicionar_prestacionDeServicio(cita, duracion, materiales, observaciones);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_prestacionDeServicio;
   
END PA_CAJERO;
/










