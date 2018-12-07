--Atributos--

ALTER TABLE Personas ADD CONSTRAINT CK_PERSONAS_CEDULA CHECK (cedula > 0);
ALTER TABLE Personas ADD CONSTRAINT CK_PERSONAS_TELEFONO CHECK (telefono > 0);
ALTER TABLE Empleados ADD CONSTRAINT CK_EMPLEADOS_CEDULA CHECK (cedula > 0);
ALTER TABLE Empleados ADD CONSTRAINT CK_EMPLEADOS_CARGO CHECK (cargo = 'Veterinario' OR cargo = 'Cajero' OR cargo = 'Asistente');
ALTER TABLE Veterinarios ADD CONSTRAINT CK_VETERINARIOS_CEDULA CHECK (cedula > 0);
ALTER TABLE Veterinarios ADD CONSTRAINT CK_VETERINARIOS_TIPO CHECK (tipo = 'Domestico' OR tipo = 'Rural' OR tipo = 'Especialista');
ALTER TABLE Asistentes ADD CONSTRAINT CK_ASISTENTES_CEDULA CHECK (cedula > 0);
ALTER TABLE Asistentes ADD CONSTRAINT CK_ASISTENTES_TIPO CHECK (tipo = 'Guarderia' OR tipo = 'Peluqueria');
ALTER TABLE Cajeros ADD CONSTRAINT CK_CAJEROS_CEDULA CHECK (cedula > 0);
ALTER TABLE Dueños ADD CONSTRAINT CK_DUEÑOS_CEDULA CHECK (cedula > 0);
ALTER TABLE Mascotas ADD CONSTRAINT CK_MASCOTAS_TIPOANIMAL CHECK (tipoAnimal = 'Canino' OR tipoAnimal = 'Felino' OR tipoAnimal = 'Acuatico' OR tipoAnimal = 'Roedor' OR tipoAnimal = 'Bovino' OR tipoAnimal = 'Equino' OR tipoAnimal = 'Ave');
ALTER TABLE Mascotas ADD CONSTRAINT CK_MASCOTAS_SEXO CHECK (sexo = 'Macho' OR sexo = 'Hembra');
ALTER TABLE Mascotas ADD CONSTRAINT CK_MASCOTAS_PESO CHECK (peso > 0 AND peso < 2000);
ALTER TABLE PrestacionesServicios ADD CONSTRAINT CK_PS_PRECIO CHECK (precio > 0);
ALTER TABLE PrestacionesServicios ADD CONSTRAINT CK_PS_DURACION CHECK (duracion > 0);
