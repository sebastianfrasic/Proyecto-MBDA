-- Tablas --
CREATE TABLE Personas (
nombre VARCHAR(30) NOT NULL,
cedula NUMBER(15) NOT NULL,
telefono NUMBER(15) NOT NULL,
direccion VARCHAR(50) NOT NULL,
correo VARCHAR(50) NOT NULL,
fechaNacimiento DATE NOT NULL
);

CREATE TABLE Empleados (
cedula NUMBER(15) NOT NULL,
cargo VARCHAR(15) NOT NULL,
horario VARCHAR(30) NOT NULL
);

CREATE TABLE Veterinarios (
cedula NUMBER(15) NOT NULL,
tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Asistentes (
cedula NUMBER(15) NOT NULL,
tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Cajeros (
cedula NUMBER(15) NOT NULL
);

CREATE TABLE Dueños (
cedula NUMBER(15) NOT NULL
);

CREATE TABLE Mascotas (
nombre VARCHAR(30) NOT NULL,
IDmascota NUMBER(15) NOT NULL,
tipoAnimal VARCHAR(15) NOT NULL,
raza VARCHAR(48) NOT NULL,
sexo VARCHAR(6) NOT NULL,
peso NUMBER NOT NULL,
fechaNacimiento DATE NOT NULL,
alergias VARCHAR(50),
dueño NUMBER(15) NOT NULL
);

CREATE TABLE Citas (
fecha DATE NOT NULL,
empleado NUMBER(15) NOT NULL,
solicitud NUMBER(15) NOT NULL
);

CREATE TABLE Solicitudes (
IDsolicitud NUMBER(15) NOT NULL,
fecha DATE NOT NULL,
cajero NUMBER(15) NOT NULL,
dueño NUMBER(15) NOT NULL,
mascota NUMBER(15) NOT NULL
);

CREATE TABLE SolicitudesDeServicios (
solicitud NUMBER(15) NOT NULL,
servicio VARCHAR(20) NOT NULL
);

CREATE TABLE Servicios (
nombreServicio VARCHAR(20) NOT NULL,
informacion XMLTYPE
);

CREATE TABLE PrestacionesServicios (
cita NUMBER(15) NOT NULL,
duracion NUMBER(5) NOT NULL,
precio NUMBER(10) NOT NULL,
materiales VARCHAR(50),
observaciones VARCHAR(2000)
);