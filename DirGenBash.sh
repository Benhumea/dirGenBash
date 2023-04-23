#declaracion de la shebang
#!/bin/bash

#echo "
# __      __        .__   __   .__ 
#/  \    /  \_____  |  | |  | _|__|
#\   \/\/   /\__  \ |  | |  |/ /  |
# \        /  / __ \|  |_|    <|  |
#  \__/\  /  (____  /____/__|_ \__|
#       \/        \/          \/   
# Generador de directorios en bash 1.0
#Genera 12 diretorios los nombra con los meses del año
"
# Obtenemos el año actual
ano=$(date +%Y)

#Creamos una carpeta con el nombre del año.El parametro -p se usa para que solo cree las carpetas que
#no existen.
mkdir -p "$ano"

# Creamos un array con el nombre de los meses
# El array no se debe declarar en una sola linea
meses=("01-Enero" "02-Febrero" "03-Marzo" 
"04-Abril" "05-Mayo" "06-Junio" "07-Julio" "08-Agosto" "09-Septiembre" "10-Octubre" 
"11-Noviembre" "12-Diciembre")

# Iteramos sobre cada mes y creamos una carpeta con su nombre dentro de la carpeta del año
for meses in "${meses[@]}"; do
  mkdir "$ano/$meses"
done
