#!/bin/bash

# Banner
red=$(tput setaf 1)
cyan=$(tput setaf 6)
green=$(tput setaf 2)
purple=$(tput setaf 5)
nc=$(tput sgr0)

echo -e "${red}  #####  #     # ######  ######     #######                      "
echo -e " #     # #     # #     # #     #       #     ####   ####  #      "
echo -e " #       #     # #     # #     #       #    #    # #    # #      "
echo -e " #       #     # ######  ######        #    #    # #    # #      "
echo -e " #       #     # #   #   #             #    #    # #    # #      "
echo -e " #     # #     # #    #  #             #    #    # #    # #      "
echo -e "  #####   #####  #     # #             #     ####   ####  ###### "
echo -e "                                                                 "
echo -e "${purple}Opciones de escaneo:${nc}"
echo "1) Calcular CURP"
echo "2) Revertir CURP"

# Función para calcular el dígito verificador
calcular_verificador() {
    local curp="${1^^}"  # Convertir a mayúsculas
    local suma=0

    # Valores numéricos para las letras del alfabeto
    local letras=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "Ñ" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")

    # Multiplicar cada carácter de la CURP por su posición en el alfabeto y sumar los resultados
    for (( i=0; i<16; i++ )); do
        local letra="${curp:i:1}"
        local valor=${letras[@]%%"$letra"*}
        (( suma += valor * (i+1) ))
    done

    # Calcular el dígito verificador
    local residuo=$(( suma % 10 ))
    local verificador=""

    if (( residuo == 0 )); then
        verificador="0"
    else
        verificador="${letras[residuo]}"
    fi

    echo "$verificador"
}

# Función para revertir la CURP a partir del nombre y apellidos
revertir_curp() {
    local curp="${1^^}"  # Convertir a mayúsculas
    local primer_apellido="${curp:0:1}${curp:1:1}"
    local segundo_apellido="${curp:2:1}"
    local nombre="${curp:3:2}"
    local fecha_nacimiento="${curp:9:2}/${curp:7:2}/${curp:5:2}"
    local sexo="${curp:8:1}"
    local entidad_nacimiento="${curp:11:2}"

    echo "Nombre(s): $nombre"
    echo "Primer apellido: $primer_apellido"
    echo "Segundo apellido: $segundo_apellido"
    echo "Sexo: $sexo"
    echo "Fecha de nacimiento: $fecha_nacimiento"
    echo "Entidad de nacimiento: $entidad_nacimiento"
}

# Menú de opciones
read -p "Seleccione una opción: " opcion

case $opcion in
    1)
        # Solicitar datos al usuario para calcular la CURP
        read -p "Nombre(s): " nombre
        read -p "Primer apellido: " primer_apellido
        read -p "Segundo apellido: " segundo_apellido
        read -p "Sexo (M/F): " sexo
        read -p "Fecha de nacimiento (dd/mm/aaaa): " fecha_nacimiento
        read -p "Entidad de nacimiento: " entidad_nacimiento

        # Calcular los primeros 16 caracteres de la CURP
        curp="${primer_apellido:0:1}${primer_apellido:1:1}${segundo_apellido:0:1}${nombre:0:2}${fecha_nacimiento:8:2}${fecha_nacimiento:3:2}${fecha_nacimiento:0:2}${sexo}${entidad_nacimiento:0:2}"

        # Calcular el dígito verificador
        verificador=$(calcular_verificador "$curp")

        # Mostrar la CURP completa
        echo "CURP: $curp$verificador"
        ;;
    2)
        # Solicitar CURP al usuario para revertir
        read -p "Ingrese la CURP: " curp

        # Revertir la CURP e imprimir los datos
        echo -e "\nDatos obtenidos de la CURP:"
        revertir_curp "$curp"
        ;;
    *)
        echo "Opción inválida. Saliendo del programa."
        exit 1
        ;;
esac
