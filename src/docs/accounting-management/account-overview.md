---
title: Generalidades de la Contabilidad Solop ERP
category: Documentation
star: 9
sticky: 9
article: false
---

A continuación se explicará la filosofía de la contabilidad en Solop ERP. Se responde a la pregunta: ¿Qué es la Contabilidad en Solop ERP?

No se va a explicar aquí detalladamente cómo funciona la Contabilidad ni cómo manejarla porque ése será el enfoque de otros capítulos.

La contabilidad de [Solop ERP](https://solopsoftware.com/es/inicio/) está altamente automatizada; eso concretamente significa que al ejecutarse cualquiera de los siguientes Procesos/Documentos Solop ERP automáticamente crea los asientos contables, realizando cálculos de costos, impuestos, etc.

* Compras
* Ventas
* Recibo de material
* Entrega de material
* Pagos
* Cobros
* Inventario
* procesos de Nómina
* procesos de Activos fijos
* Producción
* etc.

Para poder lograrlo, se requiere configurar previamente en Solop ERP como se desea contabilizar. Una vez que Solop ERP haya sido configurado, los usuarios sólo necesitan ejecutar los procesos arriba mencionados (Compras, Ventas, etc.) y la Contabilidad se generará automáticamente sin necesitar prácticamente gestión humana.

**Asientos Diarios Manuales**

Se requerirán asientos contables manuales cuando sea preciso ejecutar movimientos especiales, como por ejemplo cuando se requiera mover cuentas de ganancias de capital o semejantes o que el auditor sugiera ejecutar ciertos movimientos contables. En los demás casos, Solop ERP maneja la Contabilidad automáticamente.

## Contabilidad en Solop ERP

La Contabilidad es el centro de cualquier sistema ERP donde se recopila toda la información financiera para posteriormente analizarla de forma resumida mediante estados financieros y así poder tomar decisiones empresariales.

El objeto central de la Contabilidad es el *Catálogo de Cuentas*, que se define en la ventana *Elemento Contable*, pestaña *Valor de Elemento*.

Comúnmente,  el *Catálogo de Cuentas* es importado durante la implementación de Solop ERP, y sólo se modifica para añadir una cuenta cuando sea requerido. Por ejemplo, si se añade una cuenta bancaria, o un nuevo impuesto.

Los datos maestros sujetos a configuración y ajustes en las cuentas contables son:

* Grupo de Socios Del Negocio
* Socios Del Negocio
* Categoría de Producto
* Producto
* Cargo
* Cuentas bancarias
* Impuestos

En cada uno de estos datos maestros existe una pestaña *Contabilidad* donde se puede configurar la contabilidad de cada registro.

Las reglas contables de Solop ERP operan solamente sobre la configuración contable de los siguientes datos maestros:

* Socios Del Negocio
* Producto
* Cargo
* Cuentas bancarias
* Impuestos

En la ventana *Esquema Contable*, pestaña *Por Defecto*, se encuentran las cuentas (en realidad combinaciones contables, pero por simplicidad, llamémosles cuentas) de las cuales se alimentan los datos maestros arriba mencionados.

## Detalle de los asientos contables

Los asientos contables en Solop no son comprimidos, sino que son tan detallados como uno desee, es decir, cuentan con información muy atómica de cada acción desde donde son generados.

Esto trae como consecuencia que los reportes contables en Solop ERP sean un resumen de muchos asientos contables. Eso es una diferencia con también con las otras contabilidades que prácticamente del asiento contable ya está resumido, en Solop ERP no; el asiento contable es muy detallado.

## Cuentas Puente

Debido a la alta automatización con la que cuenta Solop ERP permitiendo que cada Documento genere el impacto contable que le corresponde, esto ocasiona que en varios de los procesos normales empresariales, Solop ERP maneje Cuentas Puente que irán regularizando lo que "El Documento" en sí sabe que puede aplicar contablemente. Esto permite que siempre se cuente con una realidad exacta, permitiendo cada una de las acciones que pueden ser posibles de darse en el ámbito empresarial, puedan ser reflejada automáticamente en la contabilidad y no requiera de ningún ajuste posterior ni control de que ocurra alguna acción adicional para poderlo contabilizar.


Estas Cuentas Puente serán completamente controladas y verificadas con reportes auxiliares que explicarán en términos más simples, cómo se ocasiona cierto saldo en cada una de ellas.
