select p.id_paciente, p.nombre, p.apellido, count(c.id_citas) as total_citas
from pacientes p
join citas c on p.id_paciente = c.paciente_id
where c.fecha_hora >= (current_date - interval '1 month')
group by p.id_paciente, p.nombre, p.apellido
having count(c.id_citas) > 3;

select e.especialidad, d.nombre, d.apellido, count(c.id_citas) as total_citas
from doctores d
join especialidades e on d.especialidad_id = e.id
left join citas c on d.id_doctor = c.doctor_id
group by e.especialidad, d.nombre, d.apellido
order by e.especialidad, total_citas desc;


select id_medicamento, nombre, stock_actual, stock_minimo
from medicamentos
where stock_actual < stock_minimo;


select tipo, count(*) as habitaciones_disponibles
from habitaciones
where estado = 'operativa'
group by tipo;


select 
p.nombre as paciente,
p.apellido,
c.fecha_hora,
d.nombre as doctor,
d.apellido as doctor_apellido,
e.especialidad,
diag.codigo_cie10,
diag.descripcion as diagnostico,
diag.gravedad,
t.descripcion as tratamiento,
m.nombre as medicamento,
tm.dosis,
tm.frecuencia,
tm.duracion_dias

from pacientes p
join citas c on p.id_paciente = c.paciente_id
join doctores d on c.doctor_id = d.id_doctor
join especialidades e on d.especialidad_id = e.id
JOIN diagnosticos diag ON c.id_citas = diag.cita_id
left join tratamientos t on diag.id_diagnostico = t.diagnostico_id
left join tratamiento_medicamento tm on t.id_tratamiento = tm.tratamiento_id
left join medicamentos m on tm.medicamento_id = m.id_medicamento
where p.cedula in ('v-31362476','v-8847623','v-26568523')
order by c.fecha_hora;

