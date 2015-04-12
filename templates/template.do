/* Proyecto: */
/* Autor: */
/* Fecha última modificación: */
/* Por hacer: */
     
clear all
cd   "/home/"
capture log close

log using "template.log", replace 
version 12.1
clear all
set linesize 80

*desactivamos more para que no existan pausas en los análisis
set more off

*ingreso de datos en forma de archivos de texto

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

/* describe
describe
summarize
codebook 
*/

log close
exit

