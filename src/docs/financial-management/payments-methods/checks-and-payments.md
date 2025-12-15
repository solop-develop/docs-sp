---
title: Cheques y Pagos
category: Documentation
star: 9
sticky: 9
article: false
---

## Opciones Para Emitir Cheques

Muchas empresas emiten Cheques a Pagar a los efectos de cancelar los compromisos con sus proveedores.

Dependiendo del tipo de empresa podrá requerir un procedimiento rápido o un procedimiento completo para la emisión de éstos cheques.

A su vez los cheques emitidos pueden ser del tipo manual o se requerirá la impresión de los cheques mediante el sistema.

### Proceso Rápido de Emisión de Cheques

Este proceso simplemente crea el Cheque y luego se lo entrega al proveedor, asignándolo al comprobante de compra que corresponda.

Este proceso normalmente utiliza la emisión manual de cheques.

### Proceso de Emisión de Cheques

En este proceso se utiliza la Funcionalidad de Selección de Pagos, flujos de trabajo a los efectos de autorizar los pagos a emitir y luego impresión de Cheques mediante el sistema.

## Gestión de Cheques Manuales por pagar

### Libretas de Cheques Propios

### Libreta de Cheques

Para emitir cheques manuales en libretas, se deberán:

* crear las libretas/resmas en el sistema
* crear las secuencias para las mismas

Para ello se deberá ir a la ventana “Libreta/Resma Cheques” y “Secuencia de Documentos Controlados”.

Primero deberá generar un nuevo registro en la ventana “Libreta/Resma Cheques”, completando el Nombre y la cuenta bancaria de la misma.

Luego de generada se deberá asignar la numeración que tendrá dicha libreta de Cheques. Para ello se deberá navegar en el campo *“Numeración de Libreta”*, abriendo la ventana *Secuencia de Documentos Controlados*.

En la ventana de secuencia de documentos controlados, se debe ingresar:

* nombre
* descripción opcional
* número de inicio y fin de la libreta

si fuera necesario un sufijo o prefijo para la numeración

Luego de guardar el registro, mediante el botón “Generar Líneas” se cargarán los datos en la pestaña “Control”, donde se visualizará el estado de los cheques.

Aquí se podrá ver si ya han sido emitidos, en qué fecha y por qué documento se emitió.

De regreso en la ventana de libreta/resma de cheques, se debe ingresar el nombre, nombre a ser impreso, cuenta bancaria y la secuencia del documento (definida anteriormente).

![Libreta/Resma Cheques](/assets/img/docs/balance-management/bam-checks2.png)

![Secuencia de Documentos Controlados](/assets/img/docs/balance-management/bam-checks3.png)

### Visualizar estado de los Cheques emitidos

En la pestaña “Cheques” se visualiza el estado de los mismos.

### Rechazo de Cheques al Día

Para realizar rechazos de Cheques al Día se deberá seguir el siguiente procedimiento:

* Realizar el Match entre el Pago/Cobro en cuestión con su línea de Conciliación Bancaria correspondiente.
* Desde el Pago/Cobro que fue rechazado al ingresar al banco se deberá correr el proceso de “Rechazo de Pago/Cobro”
* Se deberá seleccionar el tipo de rechazo y definir la fecha del mismo y darle OK


* Luego de Rechazar el Pago/Cobro en el campo “Descripción se agregará el texto “ - RECHAZADO”


* Desde la Línea del Estado de Cuenta Bancario se podrá seleccionar el Pago/Cobro Rechazado que estará con el Signo contrario del Documento Rechazado.


* Cobro Rechazado por Cobrar: El cobro en cuestión que quedará “Pendiente de Cobrar” se podrá visualizar desde la ventana “Cheques Diferidos por Cobrar” pero con el Tipo de Documento “Cheque Rechazado”.


* Para realizar el Cobro del Cheque Rechazado una vez sea abonado por el Cliente se deberá utilizar el Smart Browser de Depósito de Cheques para que ingrese al banco el nuevo pago correspondiente.

![Rechazo de Pago/Cobro](/assets/img/docs/balance-management/bam-checks1.png)

### Procesando transacciones de Caja/Bancos

En Solop ERP puede agregar rápidamente transacciones que registran los cobros de los clientes, los pagos a los proveedores, los reembolsos recibidos de proveedores, cargos y comisiones bancarias, retiros de Caja/Banco y diversos ajustes. Además, puede controlar las cuentas de Caja/Banco y administrar efectivamente estas transacciones.

Aquí, leerá cómo registrar rápidamente las transacciones en dinero de cualquier tipo y cómo el sistema las procesa.

### Tipos de transacciones de Caja/Banco

Dependiendo del propósito de la transacción, puede registrar y procesar transacciones de Caja/Banco de los siguientes tipos:

*Pago/Cobro* : crea una transacción tipo Pago para registrar una operación realizada en Caja/Banco, como un cargo bancario, intereses, un pago de un cliente, un pago a un proveedor o un pago desconocido.

*Transferencia recibida* : se crea una transacción de tipo Cobro cuando registra una transferencia de fondos entre cuentas en Caja/Banco; corresponde a los fondos recibidos a la cuenta de destino.

*Transferencia* emitida: se crea una transacción de tipo Pago cuando registra una transferencia de fondos entre cuentas en Caja/Banco; corresponde a los fondos enviados desde la cuenta de origen.

Para una transferencia de fondos, siempre hay una transacción del tipo Transferencia recibida y una transacción del tipo Transferencia emitida .

*Pago anticipado* : crea una transacción de este tipo para registrar un anticipo o pago inicial a un proveedor si el pago se realizó en Caja/Banco. Las transacciones de este tipo afectan las cuentas contable y las cuentas de proveedores en Cuentas por pagar.

*Reembolso del proveedor* : crea una transacción de este tipo para registrar un reembolso por un pago anticipado o un ajuste de débito si el reembolso se realizó en Caja/Banco. Las transacciones de este tipo afectan las cuentas contable y las cuentas de proveedores en el módulo Cuentas por pagar.

*Cobro Cliente* : crea una transacción de tipo Cobro para registrar el cobro de un cliente entrante que se realizó en Caja/Banco. Las transacciones de este tipo afectan las cuentas del Libro mayor y las cuentas de clientes en el módulo Cuentas por cobrar.

*Cobro* : crea una transacción de tipo Cobro para registrar una operación realizada en Caja/Banco, como un ingreso bancario, ingresos por intereses.

*Depósito Bancario* : crea una transacción de este tipo Pago si desea depositar pagos de clientes o reembolsos de proveedores en una cuenta de Caja/Banco. Las transacciones de este tipo afectan las cuentas contables.

*Depósito Bancario* anulado: crea una transacción de este tipo si desea anular un depósito. Las transacciones de este tipo afectan a las cuentas contables que participaron en el depósito relacionado.

### Ingresando Transacciones de Pago/Cobro

Dependiendo el Tipo de Transacción que desee ingresar debe tener claro que siempre deberá ingresar:

* Tipo de Documento
* Cuenta Bancaria
* Moneda
* Fecha
* Socio de Negocio

### Procesando Pagos de Documentos por Pagar

Al momento de ingresar un Pago, si éste está vinculado a un Documento por Pagar, puede asignarlo en ese momento.

También puede asignarlo posteriormente de manera manual en Asignación de Pagos.

En ambos casos se realizará el asiento contable de asignación.

### Procesando Cobro de Documentos por Cobrar

Al momento de ingresar un Cobro, si éste está vinculado a un Documento por Cobrar, puede asignarlo en ese momento.

También puede asignarlo posteriormente de manera manual en Asignación de Pagos.

En ambos casos se realizará el asiento contable de asignación.

### Procesamiento de una entrada de Caja/Banco

### Registro de un Pago/Cobro

Usted crea una entrada de Caja/Banco utilizando la ventana de Pago/Cobro. Selecciona una cuenta Bancaria y un tipo de entrada, moneda,

> cambia la fecha de la transacción. A continuación, agregue los detalles

de la transacción.

Para cada detalle de transacción, puede seleccionar un SDN y un cargo si corresponde.

Puede ver información resumida o la lista completa de transacciones relacionadas con efectivo realizadas en la cuenta durante este período. La información se recopila de los módulos Administración de efectivo, Libro mayor, Cuentas por pagar y Cuentas por cobrar.

## Movimientos de Cheques y Depósitos

Esta funcionalidad permite gestionar los cheques en cartera desde el momento en que se registran a través de un recibo de cobro, hasta su posterior depósito y conciliación bancaria. El proceso incluye la consulta de movimientos en la caja de cheques en cartera, la confirmación de saldos y la generación de depósitos agrupados o divididos.

### Objetivo

Brindar a los usuarios una guía práctica para:

   * Registrar correctamente los cheques en cartera.

   * Visualizar y controlar los movimientos y saldos en caja.

   * Realizar la confirmación de movimientos (cierre de caja).

   * Ejecutar los depósitos de cheques hacia las cuentas bancarias.

   * Asegurar la conciliación de los saldos entre el sistema y el banco.

### Flujo del Proceso

   1. Generar Recibo de Cobro → Registro inicial del cheque (estado borrador → completado).

   2. Caja de Cheques en Cartera → Consulta de saldos y movimientos.

   3. Cierre de Caja → Confirmación de movimientos y conciliación interna.

   4. Depósito de Caja → Selección de cheques a depositar (agrupados o divididos).

   5. Reporte Detalle de Caja → Validación de entradas/salidas y conciliación bancaria.

![Flujo](/assets/img/docs/balance-management/bam-checks4.png)

### Procedimiento

#### 1. Generar Recibo de Cobro

   * Acceder a Recibo de Cobro.

   * Seleccionar cliente.

   * Generar Cobro (cheques).

   * Completar el recibo → Los cheques pasan a la cuenta Cheques en Cartera.

![Flujo](/assets/img/docs/balance-management/bam-checks5.png)

![Flujo](/assets/img/docs/balance-management/bam-checks6.png)

#### 2. Consultar Movimientos en Caja de Cheques en Cartera

   * Ir a Gestión Financiera → Diario de Caja → Detalle de Caja.

   * Generar reporte para visualizar:

   * Saldos anteriores.

   * Nuevos movimientos.

   * Entradas y salidas por cliente.

   * Número de documento y de cheque.

   * Desde este reporte, se puede navegar al detalle del pago o recibo correspondiente.

![Flujo](/assets/img/docs/balance-management/bam-checks7.png)

![Flujo](/assets/img/docs/balance-management/bam-checks8.png)

#### 3. Confirmar Movimientos (Cierre de Caja)

   * Ingresar en Cierre de Caja.

   * Seleccionar la cuenta Cheques en Cartera.

   * Agregar los pagos pendientes de confirmación.

   * Completar el cierre → El saldo final concuerda con el saldo en caja.

![Flujo](/assets/img/docs/balance-management/bam-checks9.png)

![Flujo](/assets/img/docs/balance-management/bam-checks10.png)

#### 4. Generar Depósitos de Cheques

   * Ir a Depósito de Caja.

   * Seleccionar la cuenta Cheques en Cartera.

   * Marcar los cheques pendientes de depósito.

Definir:

  - Fecha.

  - Socio de negocio.

  - Número de depósito.

  - Cuenta bancaria destino.

Opciones:

  - Depósito agrupado → un solo depósito por todos los cheques.

  - Depósito dividido → un depósito por cada cheque.

![Flujo](/assets/img/docs/balance-management/bam-checks11.png)

![Flujo](/assets/img/docs/balance-management/bam-checks12.png)

#### 5. Validar en Reportes

Emitir el Reporte Detalle de Caja para confirmar:

  * Salida de cheques desde caja.

  * Entrada en la cuenta bancaria.

Revisar el estado del documento:

  - Pendiente de conciliar.

  - Conciliado.

### Ejemplos

   * Caso 1: Tres cheques en un solo depósito → salida de $125 y entrada de $125 (saldo sin variación).

   * Caso 2: Dos cheques con depósito dividido → dos movimientos separados hacia la cuenta Santander Pesos.

### Observaciones

   * Es fundamental realizar el cierre de caja antes de depositar.

   * Si se selecciona la opción Dividir depósito, no se solicita número de depósito, ya que se genera uno por cada cheque.

   * Verificar siempre el estado del documento en el reporte para asegurar que quede conciliado correctamente en banco.

## Control de Cheques – Remesas

El proceso de Remesas de Cheques permite gestionar y controlar los movimientos de cheques entre los distintos locales y la central administrativa.
Cada cheque registrado debe atravesar tres movimientos principales:

  - Ingreso en la caja del local (cheque recibido en el punto de venta).

  - Cheque en tránsito (traslado del local hacia la central administrativa).

  - Ingreso en la caja de la administración (recepción final del cheque en la central).

De esta manera, el sistema asegura la trazabilidad completa del cheque y permite verificar en qué etapa se encuentra en todo momento.

### Flujo general del proceso

|            Etapa            |                    Descripción                           |
| --------------------------- | -------------------------------------------------------- |
| Cheque Recibido en el local |       Ingresado como Cheque en Cartera – Local           |
|  Envío a remesa en tránsito | Mediante Depósito de Caja. Se genera retiro en el local e ingreso en la cuenta de remesas|
|      Cheque en tránsito     |       Queda pendiente de recepción por administración    |
| Recepción en administración | Depósito de Caja desde la Org administrativa. Se ingresa a Cheques en Cartera – Administración |

### Pasos del proceso

#### 1. Verificación inicial en Caja

   * Ingresar al reporte de Detalles de Caja para visualizar el saldo y los cheques disponibles en cartera.

   * Identificar los cheques que formarán parte de la remesa (ejemplo: cheques A25 y A31).

![Flujo](/assets/img/docs/balance-management/bam-checks13.png)

![Flujo](/assets/img/docs/balance-management/bam-checks14.png)

#### 2. Envío de cheques a Remesa en Tránsito

   * Acceder al proceso Depósito de Caja desde el local.

   * Seleccionar la caja origen (ej. “Cheques en Cartera – Local”).

   * Marcar los cheques a enviar.

   * Definir como destino la Remesa en Tránsito y el socio de negocio correspondiente (ej. Remesa Admin).

El sistema generará automáticamente:

   * Documento de retiro en el local.

   * Documento de ingreso en la cuenta de remesa en tránsito.

En cada movimiento se registran:

   * Pago relacionado → número único que identifica el cheque desde su ingreso.

   * Pago referido → documento que refleja el egreso/ingreso de cada movimiento posterior.

![Flujo](/assets/img/docs/balance-management/bam-checks15.png)

![Flujo](/assets/img/docs/balance-management/bam-checks16.png)

![Flujo](/assets/img/docs/balance-management/bam-checks17.png)

#### 3. Cheques en Tránsito

Los cheques enviados quedan en la cuenta de Remesa en Tránsito, visibles para la administración.

Opcionalmente, se puede agregar información complementaria (ej. persona que recibe el cheque, descripción del envío).

![Flujo](/assets/img/docs/balance-management/bam-checks18.png)

![Flujo](/assets/img/docs/balance-management/bam-checks19.png)

#### 4. Recepción en Administración

   * Ingresar a Depósito de Caja desde la organización administrativa.

   * Seleccionar como origen la Remesa en Tránsito.

   * Marcar los cheques pendientes de recepción.

   * Confirmar el ingreso en la caja de administración (ej. “Cheques en Cartera – Administración”).

   * El cheque queda registrado en la central como disponible para su posterior gestión (cobro, depósito bancario, etc.).

![Flujo](/assets/img/docs/balance-management/bam-checks20.png)

![Flujo](/assets/img/docs/balance-management/bam-checks21.png)

![Flujo](/assets/img/docs/balance-management/bam-checks22.png)

### Notas importantes

   - El Pago Relacionado permanece constante durante todo el ciclo del cheque, garantizando la trazabilidad.

   - Cada traslado genera un Pago Referido que documenta el egreso/ingreso intermedio.

   - Es posible configurar socios de negocio específicos para cada local o para la administración (ej. Remesa Admin).

   - Se recomienda revisar periódicamente la Remesa en Tránsito para evitar cheques pendientes sin recepcionar.

### Ejemplo visual (resumen)

   - Cheque A25 ingresado en Local Puerto Arenal → Caja Local (Cheques en Cartera).

   - Envío a Remesa en Tránsito → documento de retiro (local) + ingreso en cuenta de tránsito.

   - Recepción en Administración → Depósito de Caja → Cheques en Cartera Administración.