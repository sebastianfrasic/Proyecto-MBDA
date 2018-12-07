CREATE OR REPLACE PACKAGE BODY mantener_persona
IS
   PROCEDURE adicionar_persona(nombre VARCHAR,cedula NUMBER,telefono NUMBER,direccion VARCHAR,correo VARCHAR,fechaNacimiento DATE)IS
   BEGIN
   INSERT INTO Personas VALUES(nombre, cedula, telefono, direccion, correo, fechaNacimiento);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_persona;
   
   PROCEDURE modificar_persona(Nnombre VARCHAR, Ncedula NUMBER) IS
   BEGIN
   UPDATE Personas SET nombre=Nnombre WHERE cedula = Ncedula;
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_persona;
   
   
   PROCEDURE adicionar_empleado(cedula NUMBER,cargo VARCHAR, horario VARCHAR)IS
   BEGIN
   INSERT INTO Empleados VALUES(cedula ,cargo, horario);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_empleado;
   
   PROCEDURE modificar_empleado(Ncedula NUMBER,Nhorario VARCHAR) IS
   BEGIN
   UPDATE Empleados SET horario=Nhorario WHERE cedula = Ncedula;
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_empleado;
   
   PROCEDURE adicionar_veterinario(cedula NUMBER,tipo VARCHAR)IS
   BEGIN
   INSERT INTO Veterinarios VALUES(cedula ,tipo);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_veterinario;
   
   PROCEDURE modificar_veterinario(Ncedula NUMBER,Ntipo VARCHAR) IS
   BEGIN
   UPDATE Veterinarios SET tipo = Ntipo WHERE cedula = Ncedula;
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_veterinario;
   
   PROCEDURE adicionar_asistente(cedula NUMBER,tipo VARCHAR)IS
   BEGIN
   INSERT INTO Asistentes VALUES(cedula ,tipo);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_asistente;
   
   PROCEDURE modificar_asistente(Ncedula NUMBER,Ntipo VARCHAR) IS
   BEGIN
   UPDATE Asistentes SET tipo = Ntipo WHERE cedula = Ncedula;
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001, 'VALOR INGRESADO NO VALIDO');
   END modificar_asistente;
   
   PROCEDURE adicionar_cajero(cedula NUMBER)IS
   BEGIN
   INSERT INTO Cajeros VALUES(cedula);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_cajero;
   
   PROCEDURE adicionar_dueño(cedula NUMBER)IS
   BEGIN
   INSERT INTO Dueños VALUES(cedula);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_dueño; 
END mantener_persona;
/


CREATE OR REPLACE PACKAGE BODY registrar_solicitud
IS
   PROCEDURE  adicionar_solicitud(cajero NUMBER, dueño NUMBER, mascota NUMBER) IS
   BEGIN
   INSERT INTO Solicitudes(cajero, dueño, mascota) VALUES (cajero, dueño, mascota);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_solicitud;
   
   PROCEDURE  adicionar_solicitudDeServicio(servicio VARCHAR)IS
   BEGIN
   INSERT INTO SolicitudesDeServicios(servicio) VALUES (servicio);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_solicitudDeServicio;
END registrar_solicitud;
/

CREATE OR REPLACE PACKAGE BODY registar_cita
IS
   PROCEDURE  adicionar_cita(fecha DATE, empleado NUMBER, solicitud NUMBER)IS
   BEGIN
   INSERT INTO Citas VALUES (fecha, empleado, solicitud);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_cita;
END registar_cita;
/

CREATE OR REPLACE PACKAGE BODY registar_prestacionDeServicio
IS
   PROCEDURE adicionar_prestacionDeServicio(cita NUMBER, duracion NUMBER, materiales VARCHAR, observaciones VARCHAR)IS
   BEGIN
   INSERT INTO PrestacionesServicios(cita, duracion, materiales, observaciones)  VALUES (cita, duracion, materiales, observaciones);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_prestacionDeServicio;
END registar_prestacionDeServicio;
/

CREATE OR REPLACE PACKAGE BODY mantener_mascota
IS
   PROCEDURE  adicionar_mascota(nombre VARCHAR,IDmascota NUMBER,tipoAnimal VARCHAR,raza VARCHAR,sexo VARCHAR,peso NUMBER,fechaNacimiento DATE,alergias VARCHAR,dueño NUMBER)IS
   BEGIN
   INSERT INTO Mascotas  VALUES (nombre ,IDmascota ,tipoAnimal ,raza ,sexo ,peso ,fechaNacimiento ,alergias ,dueño);
   COMMIT;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END adicionar_mascota;
   
   PROCEDURE modificar_mascota(Npeso NUMBER,NIDmascota NUMBER) IS
   BEGIN
   UPDATE Mascotas SET peso = Npeso WHERE IDmascota = NIDmascota;
   EXCEPTION
   WHEN OTHERS THEN
   ROLLBACK;
   raise_application_error(-20001,'VALOR INGRESADO NO VALIDO');
   END modificar_mascota;
   
END mantener_mascota;
/