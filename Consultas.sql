-- Consultas operativas --
SELECT Personas.cedula, Personas.nombre , Cantidad
FROM Personas,(
SELECT empleado, COUNT(empleado) AS Cantidad
FROM Citas
GROUP BY empleado) 
WHERE  Personas.cedula = empleado
ORDER BY Cantidad DESC;

SELECT Mascotas.IDmascota, Mascotas.nombre,Servicio,Observacion
FROM Mascotas,(SELECT Solicitudes.mascota AS Soli, SolicitudesDeServicios.servicio AS Servicio,PrestacionesServicios.observaciones AS Observacion
FROM Solicitudes,PrestacionesServicios,SolicitudesDeServicios
WHERE PrestacionesServicios.cita = Solicitudes.IDSolicitud AND SolicitudesDeServicios.Solicitud = PrestacionesServicios.cita AND (SolicitudesDeServicios.servicio = 'Consulta' OR SolicitudesDeServicios.servicio = 'Cirugía')
)
WHERE Soli = Mascotas.IDmascota
ORDER BY Mascotas.IDmascota;


SELECT Mascotas.IDmascota, Mascotas.nombre,Inversion
FROM Mascotas,(SELECT Solicitudes.mascota AS Hola, SUM(PrestacionesServicios.precio) AS Inversion
FROM Solicitudes,PrestacionesServicios
WHERE PrestacionesServicios.cita = Solicitudes.IDSolicitud
GROUP BY Solicitudes.mascota
)
WHERE Hola = Mascotas.IDmascota
ORDER BY Mascotas.IDmascota;


SELECT nombre, fechaNacimiento, peso, alergias
FROM Mascotas, Dueños
WHERE Mascotas.dueño = Dueños.cedula;

--- Consultas gerenciales --
SELECT SUM(PrestacionesServicios.precio) AS TOTAL_VENDIDO 
FROM PrestacionesServicios
WHERE PrestacionesServicios.cita IN (SELECT Solicitud 
FROM Citas 
WHERE (SELECT (to_date(sysdate,'DD/MM/YYYY') - to_date(to_char(Citas.fecha),'DD/MM/YYYY')) from dual) < 365);