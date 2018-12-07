--HISTORIAS DE USO--
-------------------
--Una persona llamada Miguel Angel Lopez quiere llevar a su mascota a la veterinaria por primera vez. Debido a que la persona 
--no se encuentra en la base de datos es necesario que haga el registro en el cual debe ingresar su
--nombre, cedula, un tel�fono celular, su direcci�n de residencia, un e-mail y su fecha de 
--nacimiento.

EXECUTE PA_DUE�O_VETERINARIA.adicionar_due�o('Miguel Anguel Lopez', 1233908654, 3185956897, 'Avenida 179 #13-13', 'miguellopez@gmail.com', to_date('24-11-1992','DD/MM/YYYY'));


--Despu�s de registrarse, Miguel se dio cuenta que al ingresar los datos se hab�a escrito mal su 
--nombre por lo cual solicita la modificaci�n de este. 

EXECUTE PA_DUE�O_VETERINARIA.modificar_persona('Miguel Angel Lopez', 1233908654);

--Y as� finaliza correctamente el proceso de registro de un nuevo due�o
--Ahora, el due�o de la Cl�nica quiere agregar a 3 nuevos empleados que fueron contratados: un cajero, un asistente en el �rea de peluquer�a y un veterinario especialista
--Para este proceso se hace el ingreso de los respectivos datos de las personas los cuales son nombre, cedula, un tel�fono celular, 
--su direcci�n de residencia, un e-mail y su fecha de nacimiento. Luego se ingresa su respectivo cargo y tambien se adiciona el horario que van a cumplir en la Cl�nica, 
--junto con el tipo de Asistente o Veterinario

EXECUTE PA_DUE�O_VETERINARIA.adicionar_empleado('Enrique Galeano', 8657845463, 3245863535, 'Carrera 167#6-11', 'EnriqueGaleano@yahoo.es', to_date('11-11-1940','DD/MM/YYYY'), 'Cajero','Lunes a Viernes de 7am - 5pm', NULL);
EXECUTE PA_DUE�O_VETERINARIA.adicionar_empleado('Daniel Villamil', 9907313373, 3128368460, 'Calle 174#15-11', 'DanielVillamil@yahoo.es', to_date('11-07-1997','DD/MM/YYYY'), 'Asistente','Lunes a Viernes de 7am - 5pm', 'Peluqueria');
EXECUTE PA_DUE�O_VETERINARIA.adicionar_empleado('Paula Castillo', 4777384801, 3022117127, 'Carrera 162#14-12', 'PaulaCastillo@yahoo.com', to_date('2-9-1949','DD/MM/YYYY'), 'Veterinario','Sabados y Domingos 9am - 3pm', 'Especialista')

--Sin embargo, la veterinaria Paula Castillo se ve inconforme con el horario que le asignaron, por lo que le pide al due�o de la cl�nica poder cambiarlo
-- �l accede y se lo cambia, solo porque es un veterinario especialista.
EXECUTE PA_DUE�O_VETERINARIA.modificar_empleado(4777384801, 'Lunes a Viernes de 7am - 5pm');



-- Luego de que el se�or Miguel Angel Lopez estuviese registrado en la base de datos, el cajero le muestra un catalogo de los servicios que ofrece la Cl�nica para sus mascota
--NO OLVIDAR INSERTAR SERVICIOS--

SELECT * FROM Servicios;


-- Miguel ha decidido que quiere solicitar una cita para el servicio de peluquer�a para su gato Tom y una para un servicio de cirug�a para su gata Cielo
-- Como sus mascotas no est�n registrada aun en la base de datos, se debe proceder a realizar esta acci�n
EXECUTE PA_DUE�O_VETERINARIA.adicionar_mascota('Tom', 2, 'Felino', 'Angora', 'Macho', 2, to_date('10-08-2013','DD/MM/YYYY'), NULL, 1233908654);
EXECUTE PA_DUE�O_VETERINARIA.adicionar_mascota('Cielo', 3,'Felino','Munchkin','Hembra',6 ,to_date('26-07-2013','DD/MM/YYYY'), NULL, 1233908654);


--Posteriormente, con sus mascotas registrada, el cajero (quien es el unico que puede realizar esta acci�n), le registra su solicitud.
EXECUTE PA_CAJERO.adicionar_solicitud(8657845463,1233908654, 2, 'Peluquer�a');
EXECUTE PA_CAJERO.adicionar_solicitud(8657845463,1233908654, 3, 'Cirug�a');



--Luego se le asigna sus citas correspondientes, la de peluquer�a la atender� el nuevo asistente llamado Daniel Villamil y la cirug�a la nueva veterinaria llamada Paula Castillo

EXECUTE PA_CAJERO.adicionar_cita(to_date('23-05-2018','DD/MM/YYYY'), 9907313373, 2)
EXECUTE PA_CAJERO.adicionar_cita(to_date('28-05-2018','DD/MM/YYYY'), 4777384801, 3)




--Finalmente, cuando las mascotas de Miguel terminan su servicios correspondientes, se hace un registro acerca de tales servicios donde se inserta
-- La cita(IDsolicitud), la duracion en horas del servicio, su precio estandar, los materiales adicionales que fueron requeridos para el servicio, 
--y algunas observaciones (si fueron necesarias)

EXECUTE PA_CAJERO.adicionar_prestacionDeServicio(2, 1, NULL, NULL);
EXECUTE PA_CAJERO.adicionar_prestacionDeServicio(3, 5, 50000, 'Cuida su higiene: El cepillado regular es esencial debido a que elimina el pelo muerto, la suciedad y los par�sitos; adem�s, estimula el aporte de sangre hacia la piel, lo que genera un pelaje de aspecto m�s sano y brillante. Utiliza un equipo especial para esta acci�n.');

-- Finalmente Miguel quiere saber cuanto dinero invirti� en cada una de sus mascotas,  y el detalle de cada una de ellas
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
FROM Mascotas, Due�os
WHERE Mascotas.due�o = Due�os.cedula
);

SELECT * FROM DINERO_INVERTIDO;
SELECT * FROM INFO_MASCOTAS;
