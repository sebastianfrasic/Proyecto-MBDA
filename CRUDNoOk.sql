EXECUTE mantener_persona.adicionar_persona('Daniel Alejandro Rodriguez Ramirez',1234567891234567,1234567891234567,'Avenida calle 144 numero 156 a - 20','DanielAlejandroRodriguezRamirez@mail.escuelaing.edu.co',to_date('10-02-1999','DD/MM/YYYY'));
EXECUTE mantener_persona.modificar_persona('Daniel Alejandro Ramirez',1234567891234567);
EXECUTE mantener_persona.adicionar_empleado(1234567891234567,'Especialista en cirugia para perros','De lunes a viernes empezando a la 8 de la ma�ana y acabando a las 5 de la tarde');
EXECUTE mantener_persona.modificar_empleado(1234567891234567,'De lunes a sabado empezando a la 8 de la ma�ana y acabando a las 5 de la tarde');
EXECUTE mantener_persona.adicionar_veterinario(1234567891234567,'Especializado en animales rurales');
EXECUTE mantener_persona.adicionar_asistente(273102732205, 'Encargado de el corte de pelo');
EXECUTE mantener_persona.adicionar_cajero(2782960996416);
EXECUTE mantener_persona.adicionar_due�o(7258151775225);
EXECUTE registrar_solicitud.adicionar_solicitud(58460153146978,87462532149543,1234567891234);
EXECUTE registrar_solicitud.adicionar_solicitudDeServicio('Corte de cabello');
EXECUTE registar_cita.adicionar_cita(to_date('22-1-2015','DD/MM/YYYY'),828432231538194,112321567486213);
EXECUTE registar_prestacionDeServicio.adicionar_prestacionDeServicio(123546321535, 0, 'Nada', 'Ninguna');
EXECUTE mantener_mascota.adicionar_mascota('Ruffo',123456789123456,'Perro','Chigua-gua','Machote',30000,to_date('7-12-1999','DD/MM/YYYY'),'Nunguna',1234567891234564);