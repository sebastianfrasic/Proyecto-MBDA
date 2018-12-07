--MANTENER PERSONAS--

-- Los empleados deben ser mayores de 18 años --
CREATE OR REPLACE TRIGGER IN_EMPLEADOS 
BEFORE INSERT ON Empleados 
FOR EACH ROW
DECLARE
DIFERENCIA_DIAS NUMBER;
fecha DATE;
BEGIN 
SELECT fechaNacimiento INTO fecha FROM Personas WHERE :NEW.cedula = cedula;
SELECT (to_date(sysdate) - fecha)/365 into DIFERENCIA_DIAS from dual;
IF DIFERENCIA_DIAS < 18 THEN 
RAISE_APPLICATION_ERROR(-20065,'No se puede ingresar. El empleado debe ser mayor de edad');
END IF;
END IN_EMPLEADOS;
/




-- El nombre de una persona es lo único que se puede modificar --
CREATE OR REPLACE TRIGGER UP_PERSONAS
BEFORE UPDATE ON Personas
FOR EACH ROW 
BEGIN 
IF :OLD.correo != :NEW.correo THEN 
RAISE_APPLICATION_ERROR(-20001,'No se puede modificar correo.');
END IF;
IF :OLD.cedula != :NEW.cedula THEN 
RAISE_APPLICATION_ERROR(-20001,'No se puede modificar cedula.');
END IF;
IF :OLD.telefono != :NEW.telefono THEN 
RAISE_APPLICATION_ERROR(-20001,'No se puede modificar telefono.');
END IF;
IF :OLD.direccion != :NEW.direccion THEN 
RAISE_APPLICATION_ERROR(-20001,'No se puede modificar direccion.');
END IF;
IF :OLD.fechaNacimiento != :NEW.fechaNacimiento THEN 
RAISE_APPLICATION_ERROR(-20001,'No se puede modificar fecha de nacimiento');
END IF;
END UP_PERSONAS;
/


-- El horario de un empleado puede ser modificado solo si es un veterinario especialista y nadie puede cambiar de cargo.--
CREATE OR REPLACE TRIGGER UP_EMPLEADOS
BEFORE UPDATE ON Empleados
FOR EACH ROW
DECLARE 
existe NUMBER;
BEGIN 
SELECT COUNT(cedula) INTO existe FROM Veterinarios WHERE tipo = 'Especialista' AND cedula = :NEW.cedula;
IF :OLD.cargo != 'Veterinario' OR existe = 0 OR :NEW.cargo != :OLD.cargo THEN 
RAISE_APPLICATION_ERROR(-20002,'No se puede modificar.');
END IF;
END UP_EMPLEADOS;   
/



-- No se puede eliminar ningun dato de las personas, sin importar si son empleados o dueños. --
CREATE OR REPLACE TRIGGER DEL_EMPLEADOS
BEFORE DELETE ON Empleados
BEGIN 
RAISE_APPLICATION_ERROR(-20004,'No se puede eliminar');
END DEL_EMPLEADOS;
/


CREATE OR REPLACE TRIGGER DEL_VETERINARIOS
BEFORE DELETE ON Veterinarios
BEGIN 
RAISE_APPLICATION_ERROR(-20005,'No se puede eliminar');
END DEL_VETERINARIOS;
/


CREATE OR REPLACE TRIGGER DEL_DUEÑOS
BEFORE DELETE ON Dueños
BEGIN 
RAISE_APPLICATION_ERROR(-20006,'No se puede eliminar');
END DEL_DUEÑOS;
/



CREATE OR REPLACE TRIGGER DEL_ASISTENTES
BEFORE DELETE ON Asistentes
BEGIN 
RAISE_APPLICATION_ERROR(-20007,'No se puede eliminar');
END DEL_ASISTENTES;
/


CREATE OR REPLACE TRIGGER DEL_CAJEROS
BEFORE DELETE ON Cajeros
BEGIN 
RAISE_APPLICATION_ERROR(-20008,'No se puede eliminar');
END DEL_CAJEROS;
/

--REGISTRAR SOLICITUD--

--El IDsolicitud y la fecha se generan automaticamente--
CREATE OR REPLACE TRIGGER IN_SOLICITUD
BEFORE INSERT ON Solicitudes
FOR EACH ROW
DECLARE
identificador NUMBER;
fecha DATE;
BEGIN
SELECT (COUNT(*)+1) INTO identificador FROM Solicitudes;
select current_date INTO fecha from dual;
:NEW.IDsolicitud := identificador;
:NEW.fecha := fecha;
END IN_SOLICITUD;
/
--Solo se pueden asignar citas de Guardería y Peluquería a caninos y felinos. La solicitud se genera automaticamete--
CREATE OR REPLACE TRIGGER IN_SOLICITUDSERVICIO
BEFORE INSERT ON SolicitudesDeServicios  
FOR EACH ROW 
DECLARE
mascotaSOLICTUD NUMBER(15);
mascotaCITA VARCHAR(15);
solicitudD NUMBER;
BEGIN
SELECT COUNT(*)+1 INTO solicitudD FROM SolicitudesDeServicios;
:NEW.solicitud := solicitudD;
SELECT mascota INTO mascotaSOLICTUD FROM Solicitudes WHERE :NEW.solicitud = IDsolicitud;
SELECT tipoAnimal INTO mascotaCITA FROM MASCOTAS WHERE mascotaSOLICTUD = IDmascota;
IF ((:NEW.servicio = 'Peluquería' OR :NEW.servicio = 'Guardería') AND mascotaCITA != 'Canino') AND ((:NEW.servicio = 'Peluquería' OR :NEW.servicio = 'Guardería') and mascotaCITA != 'Felino') THEN
RAISE_APPLICATION_ERROR(-20028,'Animal no valido');
END IF;
END IN_SOLICITUDSERVICIO;
/

-- Si el servicio es de cirugia lo debe atender un veterinario especialista. Los servicios de peluqueria y guarderia los atienden sus respectivos asistentes. --
CREATE OR REPLACE TRIGGER IN_CITAS
BEFORE INSERT ON Citas
FOR EACH ROW 
DECLARE
especialistas NUMBER;
sservicio VARCHAR(20);
mascotaSOLICTUD NUMBER(15);
rural NUMBER;
mascotaCITA VARCHAR(15) ;
domestico NUMBER;
peluquero NUMBER;
cuidador NUMBER;
BEGIN
SELECT COUNT(*) INTO especialistas FROM VETERINARIOS WHERE cedula = :NEW.empleado AND tipo = 'Especialista';
SELECT servicio INTO sservicio FROM SolicitudesDeServicios WHERE solicitud = :NEW.solicitud;
SELECT mascota INTO mascotaSOLICTUD FROM Solicitudes WHERE :NEW.solicitud = IDsolicitud;
SELECT COUNT(*) INTO rural FROM VETERINARIOS WHERE cedula = :NEW.empleado AND tipo = 'Rural';
SELECT tipoAnimal INTO mascotaCITA FROM MASCOTAS WHERE mascotaSOLICTUD = IDmascota;
SELECT COUNT(*) INTO domestico FROM VETERINARIOS WHERE cedula = :NEW.empleado AND tipo = 'Domestico';
SELECT COUNT(*) INTO peluquero FROM ASISTENTES WHERE cedula = :NEW.empleado AND tipo = 'Peluqueria';
SELECT COUNT(*) INTO cuidador FROM ASISTENTES WHERE cedula = :NEW.empleado AND tipo = 'Guarderia';
IF especialistas = 0 AND sservicio = 'Cirugía' THEN
RAISE_APPLICATION_ERROR(-20003,'Cirugia no valida');
ELSIF sservicio = 'Consulta' AND ((domestico = 0 AND mascotaCITA != 'Bovino') AND (domestico = 0 AND mascotaCITA != 'Equino')) THEN
RAISE_APPLICATION_ERROR(-20015,'Veterinario no valido');
ELSIF sservicio = 'Consulta' AND ((rural = 0 AND mascotaCITA = 'Bovino') OR (rural = 0 AND mascotaCITA = 'Equino')) THEN
RAISE_APPLICATION_ERROR(-20015,'Veterinario no valido');
ELSIF sservicio = 'Peluquería' AND ((peluquero = 0 AND mascotaCITA = 'Felino') OR (peluquero = 0 AND mascotaCITA = 'Canino')) THEN
RAISE_APPLICATION_ERROR(-20013,'Asistente no valida');
ELSIF sservicio = 'Guardería' AND ((cuidador = 0 AND mascotaCITA = 'Felino') OR (cuidador = 0 AND mascotaCITA = 'Canino'))THEN
RAISE_APPLICATION_ERROR(-20013,'Asistente no valida');
END IF;
END IN_CITAS;
/


-- La solicitud se elimina solo si no tiene prestacion de servicio --
CREATE OR REPLACE TRIGGER DEL_SOLICITUD
BEFORE DELETE ON Solicitudes
FOR EACH ROW 
DECLARE
prestacion NUMBER;
BEGIN 
SELECT COUNT (*) INTO prestacion FROM PrestacionesServicios WHERE :OLD.IDsolicitud = cita;
IF prestacion > 0 THEN
RAISE_APPLICATION_ERROR(-20009,'No se puede eliminar. Ya fue atendido.');
END IF;
END DEL_SOLICITUD;
/


--No se puede eliminar una prestacion de servicios--
CREATE OR REPLACE TRIGGER DEL_PRESTACIONSERVICIO
BEFORE DELETE ON PrestacionesServicios
BEGIN 
RAISE_APPLICATION_ERROR(-20010,'No se puede eliminar');
END DEL_PRESTACIONSERVICIO;
/


--El precio de la prestacion de servicios se genera automaticamente.--
CREATE OR REPLACE TRIGGER IN_PRESTACION_SERVICIO
BEFORE INSERT ON PrestacionesServicios 
FOR EACH ROW
DECLARE
empleado NUMBER;
servicioo VARCHAR(20);
mascotacita NUMBER;
peso NUMBER;
BEGIN
SELECT COUNT(*) INTO empleado FROM Solicitudes WHERE IDsolicitud = :NEW.cita AND (dueño IN(SELECT cedula FROM Empleados)) ;
SELECT servicio INTO servicioo FROM SolicitudesDeServicios WHERE solicitud = :NEW.cita;
SELECT mascota INTO mascotacita FROM solicitudes WHERE IDsolicitud = :NEW.cita;
SELECT peso INTO peso FROM Mascotas WHERE IDmascota = mascotacita;
IF servicioo = 'Consulta' THEN 
:NEW.precio := 25000;
ELSIF servicioo = 'Cirugía' THEN
:NEW.precio := 300000+ (:NEW.materiales*0.1);
ELSIF servicioo = 'Hospitalización' THEN
:NEW.precio := 40000;
ELSIF servicioo = 'Laboratorio Clínico' THEN
:NEW.precio := 15000;
ELSIF servicioo = 'Peluquería' AND peso >= 20 AND peso <= 30 THEN
:NEW.precio := 40000;
ELSIF servicioo = 'Peluquería' AND peso > 30 THEN
:NEW.precio := 50000;
ELSIF servicioo = 'Peluquería' AND peso < 20 THEN
:NEW.precio := 30000;
END IF;
END IN_PRESTACION_SERVICIO;
/




