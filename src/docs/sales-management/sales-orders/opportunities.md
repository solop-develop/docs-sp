---
title: Oportunidades
category: Documentation
star: 9
sticky: 9
article: false
---

La ventana "Oportunidad" permite registrar y gestionar potenciales ventas futuras con clientes actuales o prospectos. Su objetivo es organizar, planificar y hacer seguimiento de acciones comerciales que puedan derivar en una venta efectiva.

## 🔹 1. ¿Qué es una oportunidad?

Una Oportunidad representa una posibilidad concreta de venta vinculada a un cliente o prospecto. Pueden crearse múltiples oportunidades por cliente, y se utilizan para:

* Planificar y registrar tareas comerciales (llamadas, reuniones, correos, presentaciones).

* Establecer el avance y seguimiento de una potencial venta.

* Generar cotizaciones, orden de venta y proyectos.

## 🔹 2. Alta de una Oportunidad

Para crear una nueva oportunidad se requiere completar los siguientes campos:

* Número de Oportunidad (generado automáticamente o manualmente).

* Cliente: puede ser un cliente registrado o un prospecto (Lead).

* Nombre/Descripción de la oportunidad.

* Usuario asignado / Vendedor.

* Comentarios adicionales.

* Importe estimado de la oportunidad.

* Fecha estimada de cierre (obligatoria).

* Moneda (selección manual).

* Campaña (opcional, permite vincular a campañas de marketing/comercialización activas).

* Contactos del cliente (personas de contacto relevantes).

![Campo](/assets/img/docs/sales-management/sam-sales-image519.png)

## 🔹 3. Actividades y seguimiento

Desde la pestaña Actividades se pueden planificar y registrar acciones comerciales:

* Tipo de solicitud: llamada, correo, reunión, presentación, etc.

* Tema y descripción de la tarea.

* Usuario asignado.

* Fecha de vencimiento.

Estas tareas pueden verse tanto en la pestaña Actividades como en el listado general de solicitudes. Próximamente se incorporará una lista desplegable de acciones rápidas (llamada, correo, etc.).

![Campo](/assets/img/docs/sales-management/sam-sales-image520.png)

## 🔹 4. Etapas de la oportunidad (Embudo de ventas)

Cada oportunidad puede configurarse con una etapa de avance dentro del proceso comercial. Estas etapas permiten:

* Visualizar el Embudo de Ventas.

* Controlar el estado de madurez de cada oportunidad.

::: warning
⚠️ Observación: Actualmente el orden de etapas no sigue una lógica cronológica. Se recomienda organizar las etapas desde configuración o gestionar una mejora (issue) para permitir drag & drop y orden personalizado.
También es posible visualizar el embudo agrupado por agente de ventas.
:::

![Campo](/assets/img/docs/sales-management/sam-sales-image521.png)

## 🔹 5. Creación de Cotizaciones

Cada oportunidad puede generar una o más cotizaciones:
Accedé a la opción "Crear Cotización".

Seleccioná:

* Tipo de documento: Cotización.

* Almacén (a definir por defecto).

* Lista de precios (a definir por defecto).

* Términos de pago y condiciones.

* Generá la cotización.

::: note
⚠️ Nota: Actualmente, solo se permite una cotización por oportunidad. Esto será modificado, ya que debe ser posible tener múltiples cotizaciones. También debe habilitarse una visualización clara de todas las cotizaciones vinculadas (fecha, estado, importe).
:::

![Campo](/assets/img/docs/sales-management/sam-sales-image522.png)

## 🔹 6. Asignación de Recursos

Dentro de cada cotización se pueden agregar recursos (por ejemplo: carteles, pantallas, soportes):
Definí:

* Tipo de recurso.

* Desde / Hasta (fechas de duración del servicio).

* Cantidad y unidad de medida.

* Los recursos se agrupan en la pestaña "Asignación de Recursos".

::: warning
⚠️ Importante:
Actualmente no se calcula automáticamente la cantidad total según fechas o unidades. Esto debe hacerse manualmente.
:::

* Se sugiere que los recursos se documenten como "tipo de recurso" + cantidad, en lugar de "recurso individual", para evitar errores de interpretación.

![Campo](/assets/img/docs/sales-management/sam-sales-image523.png)

## 🔹 7. Cierre de la oportunidad y creación de proyecto

Una vez seleccionada la cotización ganadora, se puede proceder a:

* Cerrar la oportunidad (marcar como "Cerrada - Ganada").

Luego, utilizar la acción "Crear Proyecto" desde la cotización ganadora.

::: warning
⚠️ No debe permitirse la creación de proyecto si la oportunidad no está cerrada como "Ganada". Se recomienda revisar esta lógica y automatizar el cierre al momento de crear el proyecto.
:::

![Campo](/assets/img/docs/sales-management/sam-sales-image524.png)

![Campo](/assets/img/docs/sales-management/sam-sales-image525.png)

## ✅ Conclusión
La funcionalidad Oportunidades - Vía Pública permite organizar el proceso comercial de forma estructurada, desde el primer contacto hasta la creación del proyecto final, incluyendo cotizaciones, actividades y recursos. Es clave seguir los pasos correctamente para mantener la trazabilidad del proceso y asegurar una gestión eficiente.