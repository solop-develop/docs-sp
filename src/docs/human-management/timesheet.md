---
title: Carga de Horas por Empleado (Time Sheet)
category: Documentation
star: 9
sticky: 9
article: false
---

La funcionalidad de Time Sheet permite registrar, controlar y aprobar las horas trabajadas por los usuarios en el sistema. Su correcta configuración asegura que cada empleado cumpla con la carga mínima de horas, y que los supervisores puedan aprobar y validar el tiempo trabajado, garantizando trazabilidad y control.

## Objetivo

* Establecer reglas de carga mínima de horas y días de gracia.

* Asegurar la correcta imputación de horas trabajadas a proyectos, contratos y clientes.

* Bloquear acciones en el sistema en caso de incumplimiento en la carga de horas.

* Permitir reportes y aprobaciones que faciliten la gestión de recursos y costos.

## Configuración

### 1. En la Compañía

- Tiempo mínimo a cargar (por usuario): mínimo diario de horas a registrar.

- Días de gracia: tolerancia para la carga de horas. Superado este límite, el usuario solo podrá cargar horas.

- Registrar tiempo sólo en días hábiles: el control aplica únicamente de lunes a viernes.

![Campo](/assets/img/docs/human-management/hum-human-image41.png)

### 2. En el Rol

- Registrar tiempo trabajado: obliga al usuario a registrar horas.

- Aprobar tiempo trabajado: permite aprobar horas cargadas por otros usuarios.

- Tiempo aprobado por defecto: determina si las horas quedan automáticamente aprobadas.

![Campo](/assets/img/docs/human-management/hum-human-image42.png)

### 3. En el Usuario

- Se repiten los campos del Rol.

- La definición en el Usuario sobrescribe la del Rol.

- Supervisor: usuario asignado para aprobar las horas cargadas.

![Campo](/assets/img/docs/human-management/hum-human-image43.png)

### 4. En el Recurso

- Se utiliza un único recurso estándar, transparente para el usuario.

- En el tipo de recurso se define el mínimo a cargar (ej.: 0.5 hs).

![Campo](/assets/img/docs/human-management/hum-human-image44.png)

### 5. En el Empleado

Se debe configurar:

- Sueldo Diario

- Departamento Nómina

- Puesto Nómina

- Esta información se usa para calcular el valor hora del empleado.

![Campo](/assets/img/docs/human-management/hum-human-image45.png)

## Carga de Horas

La carga se realiza mediante el proceso Carga de Horas, accesible desde:

- Menú principal

- Ventana Proyecto

- Ventana Contrato de Servicios

Campos principales:

- Usuario (contexto)

- Fecha

- Cantidad de horas

- Actividad

- Descripción

- Proyecto / Cliente / Contrato

## Restricciones de Carga

- Caso 1: Usuario sin carga → debe realizar primer registro.

![Campo](/assets/img/docs/human-management/hum-human-image46.png)

Mensaje del Sistema: El usuario no tiene registro de horas hasta el momento, por favor registre las horas trabajadas.

- Caso 2: Carga incompleta → error si no cumple con mínimo configurado.

Mensaje del SIstema: La cantidad diaria de registro de tiempo no cumple con el mínimo establecido en el último registro, por favor complete antes de registrar otro día.

- Caso 3: Carga fuera de orden → no se permite cargar hoy si ayer no fue cargado.

Mensaje del Sistema: Carga de horas incorrecta, las horas deben cargarse en orden cronológico evitando saltarse los días

- Caso 4: Tiempo de gracia excedido → bloqueo total hasta cargar horas faltantes.

Mensaje del Sistema: Tiempo de gracia excedido, por favor cargue su tiempo de trabajo.

## Modificación de Horas

- esde Mi Perfil → Mis Horas o ventana Usuario.

- Se puede modificar o borrar registros.

- Los registros confirmados no pueden modificarse ni eliminarse.

- En Asignación de Recurso (Resumen) se visualizan registros agrupados por fecha.

## Validaciones

- Control de registros incompletos: se revisan asignaciones antiguas y no válidas.

- Bloqueo de acciones: si no se cumple con la carga mínima en el rango de días de gracia.

- Sólo se consideran días hábiles para el control de fechas.

## Reportes y Visualización

- Reporte Hoja de Tiempo

 Por cliente, usuario, período.

- Reporte por Unidad de Negocio

- Hoja de Tiempo por Sello

- Hoja de Tiempo Valorizada → cálculo de costo hora (sueldo diario / horas).

- Reporte de Hoja de Tiempo Resumido → registros de Asignación de Recurso (Resumen).

## Aprobación

- Los supervisores aprueban desde el navegador Aprobar Registro de Horas.

- Se visualizan las horas pendientes y se confirman en bloque o individualmente.

## Resumen

✔ Control de mínimo diario al modificar horas
✔ Bloqueo al intentar cargar días posteriores si existen días incompletos
✔ Fecha sugerida = último registro + 1 día (o sugiere cargar en el día actual si nunca cargó)
✔ Bloqueo total cuando se exceden los días de gracia
✔ Validaciones en todos los procesos que registran horas (menú, proyecto, contrato, solicitud)