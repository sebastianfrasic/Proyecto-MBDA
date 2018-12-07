INSERT INTO Personas VALUES('Sebastian Gomez',1233908356,3189596541,'Cra.123 # 130C- 95','sebastiangomez@gmail.com',to_date('1-06-2000','DD/MM/YYYY'));
INSERT INTO Empleados VALUES(1233908356,'Veterinario','Lunes a Viernes de 7am - 5pm');

UPDATE Personas SET correo = 'pruebafalla@gmail.com' WHERE cedula = 1233908356;
UPDATE Personas SET cedula = 1234567891 WHERE cedula = 1233908356;
UPDATE Personas SET telefono = 1234567891 WHERE cedula = 1233908356;
UPDATE Personas SET direccion = 'Cra.156 # 15C - 25' WHERE cedula = 1233908356;
UPDATE Personas SET fechaNacimiento = to_date('4-06-2000','DD/MM/YYYY') WHERE cedula = 1233908356;


INSERT INTO Personas VALUES('Sebastian Lopez',1231234556,30365496541,'Cra.133 # 131C- 99','sebastianlopez@gmail.com',to_date('1-06-1998','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Daniela Ospina',1239768356,3197631541,'Cra.23 # 30A- 25','danielaospina@gmail.com',to_date('30-07-1985','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Paola Gomez',1213698356,31123697541,'Cra.13 # 10B- 98','paolagomez@gmail.com',to_date('31-12-1990','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Andrea Parra',1278998356,31121234541,'Cra.98 # 19- 65','andreaparra@gmail.com',to_date('6-6-1998','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Juan Sanchez',1232148356,31198763541,'Cra.100 # 45- 95','juansanchez@gmail.com',to_date('8-3-1999','DD/MM/YYYY'));
INSERT INTO Empleados VALUES(1231234556,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1278998356,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1232148356,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1239768356,'Asistente','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1213698356,'Cajero','Lunes a Viernes de 7am - 5pm');
INSERT INTO Veterinarios VALUES(1231234556,'Especialista');
INSERT INTO Veterinarios VALUES(1278998356,'Rural');
INSERT INTO Veterinarios VALUES(1232148356,'Domestico');

UPDATE Empleados SET horario = 'Sabados y Domingos 9am - 3pm' WHERE cedula = 1239768356;
UPDATE Empleados SET horario = 'Sabados y Domingos 9am - 3pm' WHERE cedula = 1213698356;
UPDATE Empleados SET horario = 'Sabados y Domingos 9am - 3pm' WHERE cedula = 1278998356;
UPDATE Empleados SET horario = 'Sabados y Domingos 9am - 3pm' WHERE cedula = 1232148356;
UPDATE Empleados SET cargo = 'Asistente.' WHERE cedula = 1231234556;
UPDATE Empleados SET cargo = 'Cajero.' WHERE cedula = 1278998356;
UPDATE Empleados SET cargo = 'Cajero.' WHERE cedula = 1232148356;
UPDATE Empleados SET cargo = 'Asietnte.' WHERE cedula = 1239768356;
UPDATE Empleados SET cargo = 'Veterinario.' WHERE cedula = 1213698356;

DELETE Empleados;
DELETE Veterinarios;
DELETE Dueños;
DELETE Asistentes;
DELETE Cajeros;

INSERT INTO Personas VALUES('Jenny Rodriguez',1298766356,31123453541,'Cra.106 # 30D- 13','jennyrodriguez@gmail.com',to_date('9-11-1979','DD/MM/YYYY'));
INSERT INTO Personas VALUES ('Santiago Pinto', 2782960996, 3265975219, 'Calle 164#14-11', 'SantiagoPinto@yahoo.es', to_date('10-3-1975','DD/MM/YYYY'));
INSERT INTO Dueños VALUES(1298766356);
INSERT INTO Empleados VALUES (2782960996,'Cajero','Lunes a Viernes de 7am - 5pm');
INSERT INTO Cajeros VALUES (2782960996);
INSERT INTO Mascotas VALUES ('Anouk',5,'Bovino','Guernsey','Macho',670.00,to_date('11-03-2010','DD/MM/YYYY'),'En la piel',1298766356);
INSERT INTO Mascotas VALUES ('Nurs',6,'Ave','Isa Brown','Hembra',0.57,to_date('11-03-2010','DD/MM/YYYY'),'Ambiente',1298766356);
INSERT INTO Solicitudes VALUES (1,to_date('11-03-2015','DD/MM/YYYY'),2782960996,1298766356,5);
INSERT INTO Solicitudes VALUES (2,to_date('11-03-2015','DD/MM/YYYY'),2782960996,1298766356,6);
INSERT INTO SolicitudesDeServicios VALUES(1, 'Peluquería');
INSERT INTO SolicitudesDeServicios VALUES(2, 'Guardería');


INSERT INTO Personas VALUES('Sebastian Lopez',1231234556,30365496541,'Cra.133 # 131C- 99','sebastianlopez@gmail.com',to_date('1-06-1998','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Daniela Ospina',1239768356,3197631541,'Cra.23 # 30A- 25','danielaospina@gmail.com',to_date('30-07-1985','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Paola Gomez',1213698356,31123697541,'Cra.13 # 10B- 98','paolagomez@gmail.com',to_date('31-12-1990','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Andrea Parra',1278998356,31121234541,'Cra.98 # 19- 65','andreaparra@gmail.com',to_date('6-6-1998','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Juan Sanchez',1232148356,31198763541,'Cra.100 # 45- 95','juansanchez@gmail.com',to_date('8-3-1999','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Jenny Rodriguez',1298766356,31123453541,'Cra.106 # 30D- 13','jennyrodriguez@gmail.com',to_date('9-11-1979','DD/MM/YYYY'));

INSERT INTO Empleados VALUES(1231234556,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1278998356,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1232148356,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1239768356,'Asistente','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1298766356,'Asistente','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1213698356,'Cajero','Lunes a Viernes de 7am - 5pm');

INSERT INTO Dueños VALUES(1231234556);
INSERT INTO Dueños VALUES(1278998356);
INSERT INTO Dueños VALUES(1232148356);
INSERT INTO Dueños VALUES(1298766356);

INSERT INTO Veterinarios VALUES(1231234556,'Especialista');
INSERT INTO Veterinarios VALUES(1278998356,'Rural');
INSERT INTO Veterinarios VALUES(1232148356,'Domestico');
INSERT INTO Asistentes VALUES(1239768356,'Guarderia');
INSERT INTO Asistentes VALUES(1298766356,'Peluqueria');
INSERT INTO Cajeros VALUES(1213698356);

INSERT INTO Mascotas VALUES ('Sigma',1,'Roedor','Hamster comun','Macho',0.05,to_date('11-03-2010','DD/MM/YYYY'),'Alimentos',1231234556);
INSERT INTO Mascotas VALUES ('Yanis',2,'Canino','Bull dog','Macho',11.00,to_date('11-03-2010','DD/MM/YYYY'),'En la piel',1278998356);
INSERT INTO Mascotas VALUES ('Zane',3,'Equino','Alter Real','Macho',438.00,to_date('11-03-2010','DD/MM/YYYY'),NULL,1232148356);
INSERT INTO Mascotas VALUES ('Lambda',4,'Acuatico','Wyandotte','Hembra',0.37,to_date('11-03-2010','DD/MM/YYYY'),'Alimentos',1298766356);

INSERT INTO Solicitudes VALUES (1,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1231234556,1);
INSERT INTO Solicitudes VALUES (2,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1278998356,2);
INSERT INTO Solicitudes VALUES (3,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1232148356,3);
INSERT INTO Solicitudes VALUES (4,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1298766356,4);
INSERT INTO Solicitudes VALUES (7,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1298766356,2);

INSERT INTO SolicitudesDeServicios VALUES(1, 'Consulta');
INSERT INTO SolicitudesDeServicios VALUES(2, 'Peluquería');
INSERT INTO SolicitudesDeServicios VALUES(3, 'Consulta');
INSERT INTO SolicitudesDeServicios VALUES(4, 'Cirugía');
INSERT INTO SolicitudesDeServicios VALUES(7, 'Guardería');

INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1278998356,1);
INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1239768356,2);
INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1232148356,3);
INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1232148356,4);
INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1298766356,7);

INSERT INTO Personas VALUES('Sebastian Lopez',1231234556,30365496541,'Cra.133 # 131C- 99','sebastianlopez@gmail.com',to_date('1-06-1998','DD/MM/YYYY'));
INSERT INTO Personas VALUES('Paola Gomez',1213698356,31123697541,'Cra.13 # 10B- 98','paolagomez@gmail.com',to_date('31-12-1990','DD/MM/YYYY'));

INSERT INTO Empleados VALUES(1231234556,'Veterinario','Lunes a Viernes de 7am - 5pm');
INSERT INTO Empleados VALUES(1213698356,'Cajero','Lunes a Viernes de 7am - 5pm');

INSERT INTO Dueños VALUES(1231234556);

INSERT INTO Veterinarios VALUES(1231234556,'Especialista');

INSERT INTO Cajeros VALUES(1213698356);

INSERT INTO Mascotas VALUES ('Sigma',1,'Roedor','Hamster comun','Macho',0.05,to_date('11-03-2010','DD/MM/YYYY'),'Alimentos',1231234556);

INSERT INTO Solicitudes VALUES (1,to_date('11-03-2015','DD/MM/YYYY'),1213698356,1231234556,1);

INSERT INTO SolicitudesDeServicios VALUES(1, 'Cirugía');

INSERT INTO Citas VALUES(to_date('30-03-2015','DD/MM/YYYY'),1231234556,1);

INSERT INTO PrestacionesServicios VALUES(1,2.403,300000,60000,'Cuida su higiene: El cepillado regular es esencial para los perros jóvenes, debido a que elimina el pelo muerto, la suciedad y los parásitos; además, estimula el aporte de sangre hacia la piel, lo que genera un pelaje de aspecto más sano y brillante. Utiliza un equipo especial para esta acción.');

DELETE Solicitudes WHERE IDsolicitud = 1;