---
title: Impresora Local
category: Documentation
star: 9
sticky: 9
article: false
---

Define la configuración necesaria para utilizar el servicio de impresión local.

## Requerimientos

### Hardware

* CPU x64
* 8 GB RAM
* 80 GB libres

### Software

* Windows 11 (Windows 10 no probado pero debería ser equivalente)
* Driver de impresora

### Adicionales

* Tener conectada la impresora a utilizar en el mismo equipo donde se va a utilizar el sistema Solop

## Instalación del Servicio

1. El instalador queda disponible en para descargar

* https://solop.nyc3.digitaloceanspaces.com/public/downloads/ERP-App-Service-2.0.2-win-x64.exe
* https://solop.nyc3.digitaloceanspaces.com/public/downloads/ERP-App-Service-2.0.2-win-x86.exe

2. Se ejecuta el instalador y se avanza en la instalación, donde solicite información referente a kafka se deja sin configurar y el tipo de conexión debe cambiarse a https

3. Se reinicia equipo y se procede a revisar que el servicio está activo

![Verificación del Servicio](/assets/img/docs/devices/printers/local-printer-1.png)

4. Se debe revisar el "Visor de Eventos" del sistema si se tiene logs y que el servicio está escuchando en el puerto 9991

![Verificación del Visor](/assets/img/docs/devices/printers/local-printer-2.png)

5. Se debe autenticar el usuario (del equipo) en el servicio para que pueda logearse en el sistema al iniciar el mismo, debe ingresarse el nombre talcual del usuario del sistema operativo como la contraseña y validar que deje guardar (el usuario debe configurarse con el botón "Examinar")

![Asignación de Usuario a Servicio](/assets/img/docs/devices/printers/local-printer-3.png)

![Usuario asignado a Servicio](/assets/img/docs/devices/printers/local-printer-4.png)

6. Se debe agregar el Puerto de entrada 9991 como excepción en el firewall, eso se hace desde la configuración del firewall

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-5.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-6.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-7.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-8.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-9.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-10.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-11.png)

![Excepción en Firewall](/assets/img/docs/devices/printers/local-printer-12.png)

7. Debe tener el driver de la impresora instalado previamente, eso puede consutar la sección de Drivers de Impresoras

8. Para el servicio de impresión se va a tomar la impresora por defecto, entonces debe marcarse la misma en el sistema operativo como por defecto

![Impresora por Defecto](/assets/img/docs/devices/printers/local-printer-13.png)

9. Desmarcar opción que indica que Windows administre la opción predeterminada y asegurase que la impresora que queremos utilizar para imprimir sea la predeterminada.

![Impresora por Defecto](/assets/img/docs/devices/printers/local-printer-14.png)

## Configuración de Impresora en Vue

1. Iniciar sesión en vue

2. Ir al perfil de usuario -> Click en foto de perfil -> Preferencias

3. Completar información referente a Impresora

- Host de impresora http://localhost:9991
- Nombre de Impresora (puede ser cualquiera)
- Impresion directa SI

![Configuración VUE](/assets/img/docs/devices/printers/local-printer-16.png)

## Validación de Impresión

- Si todo ha quedado correctamente configurado, al presionar el botón "Imprimir una Página de Prueba", deberá salir la impresión directamente en la impresora por defecto.
