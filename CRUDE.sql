CREATE OR REPLACE PACKAGE mantener_persona
IS
PROCEDURE adicionar_persona(nombre VARCHAR, cedula NUMBER, telefono NUMBER, direccion VARCHAR, correo VARCHAR, fechaNacimiento DATE);
PROCEDURE modificar_persona(Nnombre VARCHAR, Ncedula NUMBER);
PROCEDURE adicionar_empleado(cedula NUMBER,cargo VARCHAR, horario VARCHAR);
PROCEDURE modificar_empleado(Ncedula NUMBER,Nhorario VARCHAR);
PROCEDURE adicionar_veterinario(cedula NUMBER,tipo VARCHAR);
PROCEDURE modificar_veterinario(Ncedula NUMBER,Ntipo VARCHAR);
PROCEDURE adicionar_asistente(cedula NUMBER,tipo VARCHAR);
PROCEDURE modificar_asistente(Ncedula NUMBER,Ntipo VARCHAR);
PROCEDURE adicionar_cajero(cedula NUMBER);
PROCEDURE adicionar_dueño(cedula NUMBER);
END;
/

CREATE OR REPLACE PACKAGE registrar_solicitud
IS
PROCEDURE adicionar_solicitud(cajero NUMBER, dueño NUMBER,mascota NUMBER);
PROCEDURE adicionar_solicitudDeServicio(servicio VARCHAR);
END;
/

CREATE OR REPLACE PACKAGE registar_cita
IS
PROCEDURE adicionar_cita(fecha DATE, empleado NUMBER, solicitud NUMBER);
END;
/

CREATE OR REPLACE PACKAGE registar_prestacionDeServicio
IS
PROCEDURE adicionar_prestacionDeServicio(cita NUMBER, duracion NUMBER, materiales VARCHAR, observaciones VARCHAR);
END;
/

CREATE OR REPLACE PACKAGE mantener_mascota
IS 
PROCEDURE adicionar_mascota(nombre VARCHAR, IDmascota NUMBER, tipoAnimal VARCHAR, raza VARCHAR, sexo VARCHAR, peso NUMBER, fechaNacimiento DATE, alergias VARCHAR, dueño NUMBER);
PROCEDURE modificar_mascota(Npeso NUMBER, NIDmascota NUMBER);
END;
/

