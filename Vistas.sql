--Vistas--

CREATE OR REPLACE VIEW CITAS_ATENTIDAS AS (
SELECT Personas.cedula, Personas.nombre , Cantidad
FROM Personas,(
SELECT empleado, COUNT(empleado) AS Cantidad
FROM Citas
GROUP BY empleado) 
WHERE  Personas.cedula = empleado
);


CREATE OR REPLACE VIEW OBSERV_SERVICIOS AS (
SELECT Mascotas.IDmascota, Mascotas.nombre,Servicio,Observacion
FROM Mascotas,(SELECT Solicitudes.mascota AS Soli, SolicitudesDeServicios.servicio AS Servicio,PrestacionesServicios.observaciones AS Observacion
FROM Solicitudes,PrestacionesServicios,SolicitudesDeServicios
WHERE PrestacionesServicios.cita = Solicitudes.IDSolicitud AND SolicitudesDeServicios.Solicitud = PrestacionesServicios.cita AND (SolicitudesDeServicios.servicio = 'Consulta' OR SolicitudesDeServicios.servicio = 'Cirugía')
)
WHERE Soli = Mascotas.IDmascota
);

CREATE OR REPLACE VIEW DINERO_INVERTIDO AS 
(SELECT Mascotas.IDmascota, Mascotas.nombre,Inversion
FROM Mascotas,(SELECT Solicitudes.mascota AS Hola, SUM(PrestacionesServicios.precio) AS Inversion
FROM Solicitudes,PrestacionesServicios
WHERE PrestacionesServicios.cita = Solicitudes.IDSolicitud
GROUP BY Solicitudes.mascota
)
WHERE Hola = Mascotas.IDmascota
);

CREATE OR REPLACE VIEW INFO_MASCOTAS AS(
SELECT nombre, fechaNacimiento, peso, alergias
FROM Mascotas, Dueños
WHERE Mascotas.dueño = Dueños.cedula
);
