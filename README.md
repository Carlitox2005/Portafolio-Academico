# Portafolio-Academico
Justificación de la Base de Datos Hospitalaria
El diseño separa pacientes, doctores, citas, diagnósticos, tratamientos, medicamentos y recursos físicos en tablas independientes, lo que facilita la gestión y evita confusión.
La normalización asegura que los datos no se repitan innecesariamente. Por ejemplo, las especialidades médicas se almacenan en una sola tabla y se relacionan con los doctores mediante claves foráneas.
Las claves primarias y foráneas garantizan que las relaciones entre entidades sean coherentes y válidas.
El esquema modular permite agregar nuevas entidades (como laboratorios o seguros) sin alterar la estructura existente, manteniendo la base flexible y fácil de mantener.

Manual de instalación y uso
Crear la base de datos En PostgreSQL, ejecutar:
create database hospital;
Luego conectarse con:
hospital
Ejecutar el archivo creacion_bd.sql  para crear todas las tablas, claves primarias, foráneas y restricciones:
Ejecutar el archivo datos_prueba.sql para poblar la base con pacientes, doctores, citas, diagnósticos, tratamientos y medicamentos:
Usar el archivo consultas.sql para obtener reportes frecuentes (pacientes con más de 3 citas, stock de medicamentos, historial médico, etc.):

