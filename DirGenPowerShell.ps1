#echo "
# __      __        .__   __   .__ 
#/  \    /  \_____  |  | |  | _|__|
#\   \/\/   /\__  \ |  | |  |/ /  |
# \        /  / __ \|  |_|    <|  |
#  \__/\  /  (____  /____/__|_ \__|
#       \/        \/          \/   
# Generador de directorios en powershell v 1.0
#Genera 12 diretorios los nombra con los meses del año

#El siguiente script tiene como finalidad crear una carpeta que se nombre como el año en curso, dentro de esa carpeta crea una carpeta por mes y dentro de cada carpeta por mes crea una por cada semana, comenzando la semana en domingo.


# Obtener el año actual
$year = (Get-Date).Year
# Crear un directorio con el año actual
New-Item -ItemType Directory -Path ".\$year" -ErrorAction Ignore
# Iterar a través de cada mes del año
for ($i = 1; $i -le 12; $i++) {
    # Obtener el nombre del mes
    $monthName = (Get-Date -Month $i -Year $year).ToString("MMMM")
    # Crear una carpeta con el nombre del mes
    New-Item -ItemType Directory -Path ".\$year\$($i.ToString("000"))$monthName" -ErrorAction Ignore
    # Obtener el primer día del mes
    $firstDayOfMonth = (Get-Date -Month $i -Year $year).Date
    # Obtener el último día del mes
    $lastDayOfMonth = (Get-Date -Month $i -Year $year).AddMonths(1).AddDays(-1).Date
    # Iterar a través de cada semana del mes
    while ($firstDayOfMonth -le $lastDayOfMonth) {
        # Obtener el número de semana del mes
        $weekOfMonth = Get-WeekOfYear -WeekOfYear $firstDayOfMonth.DayOfYear -Year $firstDayOfMonth.Year
        # Crear una carpeta con el número de semana y el nombre del mes
        New-Item -ItemType Directory -Path ".\$year\$($i.ToString("000"))$monthName\Semana $weekOfMonth - $monthName" -ErrorAction Ignore
        # Actualizar el primer día del mes al siguiente domingo
        $firstDayOfMonth = $firstDayOfMonth.AddDays(7)
    }
}