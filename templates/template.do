/* Proyecto:                        */
/* Autor:                           */
/* Fecha última modificación:       */
/* Por hacer:                       */

* limpiamos la memoria por completo, cambiamos al directorio
* de trabajo y cerramos el registro de log si está abierto
clear all
cd   "/home/"
capture log close

* iniciamos el registro de log, definimos la versión que se usará y damos
* formato a la salida por pantalla.
* desactivamos more para que no existan pausas al correr los comandos.

log using "template.log", replace 
version 15.1
clear all
set linesize 80
set more off

* ingreso de datos en forma de archivos de texto
insheet using "Estudiantes 1ra y 2da fila.csv", delimiter(";")

generate id2 = _n  /* Para no perder el orden original en la */
				   /* Base de Datos proporcionadas           */

/* comprimiendo variables muy extensas */

ds , has(type 1/244)
compress `r(varlist)'

* Etiquetando los datos
label data "Nombre de base de datos"

* Definiendo datasignature
datasignature set

* Guardando los datos
save "admin_fecha_proyecto_datos_limpios", replace

/* descripción de las variables en la base
    describe
    summarize
    codebook 
*/

log close
exit

