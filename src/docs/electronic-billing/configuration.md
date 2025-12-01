---
title: Configuración Comprobantes Fiscales Electrónicos
category: Documentation
star: 9
sticky: 9
article: false
---

El circuito de facturación electrónica requiere configurar correctamente distintos elementos del sistema para permitir la emisión y el envío exitoso de comprobantes fiscales electrónicos (CFE) a la entidad fiscal correspondiente.

Este documento detalla la configuración previa necesaria en el ERP antes de emitir comprobantes fiscales.

---

## Requisitos Previos

Antes de generar un comprobante fiscal electrónico, se deben cumplir las siguientes condiciones:

- Definir correctamente un **socio del negocio** válido.
- Asociar al socio un **grupo de impuestos** con tipo de CFE adecuado.
- Configurar el **tipo de documento fiscal** con los parámetros necesarios.

---

## Definición de Entidades 

### 1. Socio del negocio

Antes de emitir cualquier documento electrónico, es indispensable seleccionar un **socio del negocio** válido (cliente).  
*Ejemplo*: Casa Gutiérrez.

#### Grupo de impuestos

El **grupo de impuestos** asociado al socio del negocio define el **tipo de documento fiscal electrónico** que se utilizará en el envío a la entidad fiscal.

* Ejemplos comunes:

- Cédula / DNI / Pasaporte / Otros → *e-Ticket*
- Empresas u organizaciones → *e-Factura*

* Consideraciones:

- El grupo de impuestos debe tener definidos los tipos de CFE válidos.
- Si no se asigna un grupo de impuestos válido al socio, el sistema no podrá completar ni enviar correctamente el documento.

---

### 2. Tipo documento fiscal

Cada tipo de documento fiscal que se utilice para generar un CFE (facturas, notas de crédito, etc.) debe cumplir con la siguiente configuración:

- Tener definido un **tipo de CFE válido**.
- Tener activada la opción **¿Maneja facturación electrónica? = Sí**.
- Tener activada la opción **¿Enviar después de completar? = Sí**.

---

::: warning
Importante: Solo debe existir un tipo de documento fiscal por instancia. No se deben definir diferentes tipos por organización.
:::


## 1. Introducción

La facturación electrónica permite emitir comprobantes fiscales electrónicos (CFE) desde el sistema, cumpliendo con los requisitos de la DGI y utilizando un proveedor fiscal (Invoicy u otro).
Este documento detalla:

* Las configuraciones previas necesarias.

* Qué datos son responsabilidad del usuario final.

* El flujo operativo para emitir facturas electrónicas.

* Las validaciones posteriores y controles de errores.

* Consideraciones especiales para Notas de Crédito.

El objetivo es que el usuario pueda comprender el proceso completo y validar la correcta emisión de un CFE sin depender del área técnica, salvo en las configuraciones iniciales.

## 2. Objetivo

Asegurar que el usuario final conozca:

* Qué configuraciones debe verificar antes de emitir un comprobante electrónico.

* Cómo generar una factura electrónica desde el sistema.

* Cómo controlar el estado del envío, errores y rechazos.

* Cómo emitir correctamente una Nota de Crédito electrónica, incluyendo su referencia obligatoria.

## 3. Alcance

Este documento aplica a:

* Facturación electrónica en Uruguay.

* Comprobantes de venta: E-Factura, E-Ticket, E-Nota de Crédito.

* Emisiones individuales o masivas desde los procesos del sistema.

* Validación de CFE enviados mediante proveedor fiscal.


## 4. Configuraciones Previas

### 4.1 Configuraciones realizadas por Soporte o Consultor

Estas configuraciones no son responsabilidad del usuario. Están a cargo del área técnica y se dejan establecidas antes de iniciar operación:

**a. Tipo de Documento**

* Definición de documentos electrónicos: E-Factura, E-Ticket, E-Nota de Crédito.

* Marcado del documento como “maneja facturación electrónica”.

* Definición del comportamiento: envío automático al completar.

* Seteo de secuencias, numeración y reglas fiscales.

**b. Proveedor Fiscal / Servidor**

* Configuración de la organización con el proveedor fiscal (Invoicy).

* Certificados, tokens o credenciales de comunicación.

* Parámetros de entorno y URLs de servicios.

**c. Comportamientos fiscales por país**

* Tipificación de CFE según normativa nacional.

* Comportamiento específico según RUT o Cédula.

* El usuario no debe modificar estas configuraciones para evitar inconsistencias.

## 5. Configuraciones Responsabilidad del Usuario

Estas configuraciones deben revisarse cada vez que se crea o modifica un Socio de Negocio.

### 5.1 Datos del Socio de Negocio

En la ventana de Socio de Negocio validar:

**a. Identificación Grupo de Impuesto**

El Grupo de impuestos asociado al socio del negocio define el Tipo de documento fiscal electrónico que se utilizará en el envío a la entidad fiscal.

* Si es RUT → generará E-Factura.

* Si es Cédula → generará E-Ticket.

* Tasa IVA

* Tratamientos especiales

Validar que el número de identificaciòn RUT esté correctamente ingresado y sin errores de formato.

::: note
Esto determina cómo se calcularán los impuestos en el CFE enviado a la DGI.
:::

**5.2 Validaciones previas del documento**

Previo a completar la factura:

* Revisar que los ítems tengan impuestos correctos.

* Verificar que el tipo de documento seleccionado sea el correspondiente (E-Factura, E-Ticket, NC).

* En caso de Nota de Crédito, asegurarse de generarla usando “Crear Desde” para arrastrar la referencia obligatoria.

## 6. Flujo General de Emisión de Factura Electrónica

**Paso 1: Crear la Factura**

Crear Documentos por Cobrar:

* Crear una factura manualmente (desde ventana DOcumentos por Cobrar).

* Generar una factura desde un proceso masivo o navegador.

**Paso 2: Completar la Factura**

Al completar:

* El sistema envía automáticamente el CFE al proveedor fiscal, según la configuración del tipo de documento.

* Se genera un registro en la solapa Bitácora de Documentos Electrónicos.

**Paso 3: Validar Bitácora de Documentos Electrónicos**

En esta solapa se visualiza:

* Estado del envío (pendiente, enviado, rechazado, aceptado).

* Mensajes de error o rechazo.

* URL del comprobante electrónico.

* Representación gráfica (PDF).

* Identificadores fiscales (CAE, número fiscal, etc.).

::: note
Si hubo error, debe corregirse la causa y reenviarse el comprobante.
:::

**Paso 4: Recepción de Respuesta del Proveedor Fiscal**

El sistema actualiza el estado de forma automática.
Si el comprobante queda en:

* Firmado → se envió ok.

* Rechazado → debe revisarse mensaje y corregirse.

## 7. Emisión de Nota de Crédito Electrónica

**7.1 Cómo generar una Nota de Crédito válida**

Siempre realizar la NC con la función:

* Crear Desde → Facturas

Esto garantiza que:

* El documento quede vinculado a la factura original.

* Se genere la referencia obligatoria para DGI.

* Se arrastren montos e ítems correctamente.

**7.2 Validación de la relación con la factura**

En la solapa Facturas a Asignar validar:

* Que la factura referenciada esté correcta.

* Si se genera manualmente sin “Crear Desde”, se debe completar esta solapa de forma manual.

## 8. Validaciones Posteriores y Controles

**8.1 Bitácora de Documentos Electrónicos**

Control central del estado del CFE.

Verificar:

* Si está firmado.

* Si fue aceptado/rechazado.

* Mensaje del proveedor.

* Datos de la representación gráfica generada.

**8.2 Errores Comunes**

| Error común                               | Causa probable	                          |  Solución                            |
| ----------------------------------------- | ------------------------------------------- | ------------------------------------ |
|    Documento rechazado por RUT inválido   |   Mal ingreso en socio de negocio	          |   Corregir identificación y reenviar |
| Falta de referencia en Nota de Crédito    |	No se utilizó “Crear Desde”	              |   Completar dato Factura a Asignar   |
| No hay ninguna CAE para tipo documento    |  Se usó último CFE o está vencido           | Solicitar a DGI nuevo CAE del Tip Doc|


## *9. Resultado Esperado del Proceso

Una vez completada la factura:

* El sistema envía el comprobante al proveedor fiscal.

* El proveedor valida y devuelve estado (la devoluciòn se ve en Invoicy en caso de rechazo o autorizado, en Solop ERP, solapa bitácora de documentos electrónicos la comunicación es solo de ida).

* La bitácora muestra el CFE como firmado.

* El PDF fiscal queda disponible.

* El comprobante queda autorizado ante DGI (puede verse este estado en Invoicy)

## 10. Observaciones Finales

* El usuario solo debe revisar los datos del socio y emitir los comprobantes.

* Ninguna configuración fiscal avanzada debería ser modificada por el usuario.

* Siempre verificar la bitácora ante cualquier duda.

* Toda Nota de Crédito debe tener referencia obligatoria.