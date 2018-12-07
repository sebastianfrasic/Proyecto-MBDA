--Foraneas--
ALTER TABLE Empleados ADD CONSTRAINT FK_EMPLEADOS_PERSONAS
  FOREIGN KEY (cedula) REFERENCES Personas(cedula);

ALTER TABLE Veterinarios ADD CONSTRAINT FK_VETERINARIOS_EMPLEADOS
  FOREIGN KEY (cedula) REFERENCES Empleados(cedula);

ALTER TABLE Asistentes ADD CONSTRAINT FK_ASISTENTES_EMPLEADOS
  FOREIGN KEY (cedula) REFERENCES Empleados(cedula);

ALTER TABLE Cajeros ADD CONSTRAINT FK_CAJEROS_EMPLEADOS
  FOREIGN KEY (cedula) REFERENCES Empleados(cedula);

ALTER TABLE Due�os ADD CONSTRAINT FK_DUE�OS_PERSONAS
  FOREIGN KEY (cedula) REFERENCES Personas(cedula);

ALTER TABLE Mascotas ADD CONSTRAINT FK_MASCOTAS_DUE�OS
  FOREIGN KEY (due�o) REFERENCES Due�os(cedula);

ALTER TABLE Citas ADD CONSTRAINT FK_CITAS_EMPLEADOS
  FOREIGN KEY (empleado) REFERENCES Empleados(cedula);

ALTER TABLE Citas ADD CONSTRAINT FK_CITAS_SOLICITUDES
  FOREIGN KEY (solicitud) REFERENCES Solicitudes(IDsolicitud);

ALTER TABLE Solicitudes ADD CONSTRAINT FK_SOLICITUDES_CAJEROS
  FOREIGN KEY (cajero) REFERENCES Cajeros(cedula);

ALTER TABLE Solicitudes ADD CONSTRAINT FK_SOLICITUDES_DUE�OS
  FOREIGN KEY (due�o) REFERENCES Due�os(cedula);

ALTER TABLE Solicitudes ADD CONSTRAINT FK_SOLICITUDES_MASCOTAS
  FOREIGN KEY (mascota) REFERENCES Mascotas(IDmascota);

ALTER TABLE SolicitudesDeServicios ADD CONSTRAINT FK_SDS_SOLICITUDES
  FOREIGN KEY (solicitud) REFERENCES Solicitudes(IDsolicitud);

ALTER TABLE SolicitudesDeServicios ADD CONSTRAINT FK_SDS_SERVICIOS
  FOREIGN KEY (servicio) REFERENCES Servicios(nombreServicio);

ALTER TABLE PrestacionesServicios ADD CONSTRAINT FK_PDS_CITAS
  FOREIGN KEY (cita) REFERENCES Citas(solicitud);