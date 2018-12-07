--CRUDS OK--
EXECUTE mantener_persona.adicionar_persona('Diego Rubio', 2419551704, 3264492402, 'Carrera 133#19-11', 'DiegoRubio@gmail.com', to_date('6-10-1948','DD/MM/YYYY'));
EXECUTE mantener_persona.adicionar_persona('Helena Montoya', 8557135839, 3172166945, 'Carrera 165#22-9', 'HelenaMontoya@yahoo.com', to_date('27-12-1976','DD/MM/YYYY'));
EXECUTE mantener_persona.adicionar_persona('Paulaaa Rodriguez', 8962081192, 3299792274, 'Avenida 75#5-8', 'PaulaRodriguez@yahoo.es', to_date('16-3-1949','DD/MM/YYYY'));
EXECUTE mantener_persona.adicionar_persona('Sebastian Restrepo', 5592052303, 3274617473, 'Carrera 104#1-10', 'SebastianRestrepo@hotmail.com', to_date('15-4-1954','DD/MM/YYYY'));
EXECUTE mantener_persona.modificar_persona('Paula Rodriguez', 8962081192);
EXECUTE mantener_persona.adicionar_empleado(8962081192,'Cajero','Lunes a Viernes de 7am - 5pm');
EXECUTE mantener_persona.adicionar_empleado(2419551704,'Veterinario','Sabados y Domingos 9am - 3pm');
EXECUTE mantener_persona.adicionar_empleado(8557135839,'Asistente','Sabados y Domingos 9am - 3pm');


EXECUTE mantener_persona.adicionar_veterinario(2419551704,'Rural');
EXECUTE mantener_persona.adicionar_asistente(8557135839, 'Peluqueria');
EXECUTE mantener_persona.adicionar_cajero(8962081192);
EXECUTE mantener_persona.adicionar_dueño(5592052303);
EXECUTE mantener_mascota.adicionar_mascota('Brú',111,'Felino','Ocicat','Macho',7,to_date('9-2-2008','DD/MM/YYYY'),NULL,5592052303);

EXECUTE registrar_solicitud.adicionar_solicitud(8962081192, 5592052303, 111);
EXECUTE registrar_solicitud.adicionar_solicitudDeServicio('Peluquería');
EXECUTE registar_cita.adicionar_cita(to_date('22-06-2018','DD/MM/YYYY'),8557135839,1);
EXECUTE registar_prestacionDeServicio.adicionar_prestacionDeServicio(1, 45, NULL, NULL);



