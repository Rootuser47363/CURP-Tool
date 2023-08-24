# CURP Tool Beta 

CURP Tool es un script simple escrito en Bash que te permite calcular el dígito verificador de una CURP (Clave Única de Registro de Población) o revertir la CURP para obtener los datos de una persona a partir de la clave.

## Instalación

1. Abre una terminal en tu sistema.
2. Clona este repositorio en tu sistema local usando el siguiente comando: `git clone https://github.com/Rootuser47363/CURP-Tool.git`
3. Navega al directorio del proyecto: `cd CURP-Tool`
4. Otorga permisos de ejecución al archivo del script con el siguiente comando: `chmod +x curp_tool.sh`

## Uso

1. Ejecuta el script en la terminal usando `./curp_tool.sh`.
2. Selecciona una de las siguientes opciones:
   - **1) Calcular CURP:** Ingresa los datos requeridos para calcular la CURP y se mostrará el resultado.
   - **2) Revertir CURP:** Ingresa una CURP válida y se mostrarán los datos de la persona.

## Ejemplo

Supongamos que deseas calcular la CURP para una persona con la siguiente información:
- Nombre: Juan
- Primer apellido: Pérez
- Segundo apellido: López
- Género: M
- Fecha de nacimiento: 25/12/1985
- Estado de nacimiento: DF

Ejecutas el script, ingresas los datos solicitados y obtienes la CURP resultante:

```
./curp_tool.sh
Seleccione una opción: 1
Nombre(s): Juan
Primer apellido: Pérez
Segundo apellido: López
Género (M/F): M
Fecha de nacimiento (dd/mm/aaaa): 25/12/1985
Estado de nacimiento: DF
CURP: PELJ851225HDFXXA00
```

## Palabras clave

CURP, Clave Única de Registro de Población, herramienta, Bash, calcular, dígito verificador, revertir, datos de la persona, terminal, script, git.

Este script es útil para aquellos que necesiten trabajar con la CURP en sus proyectos o para cualquier persona que desee calcular el dígito verificador o revertir la CURP para obtener los datos de identificación de una persona. La herramienta proporciona una forma sencilla y rápida de realizar estas operaciones desde la terminal, lo que la hace conveniente y fácil de usar. ¡Si tienes alguna sugerencia o mejora para el script, siempre es bienvenida!

## Contribuciones

Si deseas contribuir a este proyecto o tienes ideas para mejorarlo, siéntete libre de hacerlo. Estamos abiertos a recibir pull requests y sugerencias para hacer esta herramienta aún mejor.

Espero que estas actualizaciones en el README.md ayuden a los usuarios a comprender mejor el propósito del script y cómo utilizarlo en diferentes escenarios. ¡Buena suerte con tu proyecto y no dudes en hacer cualquier otra pregunta o sugerir más mejoras!
