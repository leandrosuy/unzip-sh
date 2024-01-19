#!/bin/bash

if ! command -v zenity &>/dev/null; then
    echo "Zenity não está instalado. Por favor, instale-o para continuar."
    exit 1
fi

while true; do
    current_dir=$(pwd)

    options=("Compactar em ZIP" "Compactar em RAR" "Descompactar" "Sair")

    choice=$(zenity --list --column="Opções" "${options[@]}" --title="Gerenciador de Arquivos" --hide-header)

    case $choice in
    "Compactar em ZIP")
        file=$(zenity --file-selection --title="Selecione o arquivo para compactar" --filename="$current_dir" --file-filter="*")

        if [ -z "$file" ]; then
            zenity --error --text="Nenhum arquivo selecionado. Operação cancelada."
        else
            suggested_name=$(basename "$file")
            zip_file=$(zenity --entry --title="Nome do arquivo ZIP" --text="Digite o nome do arquivo ZIP a ser criado:" --entry-text="$suggested_name")

            if [ -z "$zip_file" ]; then
                zenity --error --text="Nome do arquivo ZIP não fornecido. Operação cancelada."
            else
                zip -j "$zip_file.zip" "$file"
                zenity --info --text="Arquivo $zip_file.zip criado com sucesso."
            fi
        fi
        ;;

    "Compactar em RAR")
        file=$(zenity --file-selection --title="Selecione o arquivo para compactar" --filename="$current_dir" --file-filter="*")

        if [ -z "$file" ]; then
            zenity --error --text="Nenhum arquivo selecionado. Operação cancelada."
        else
            suggested_name=$(basename "$file")
            rar_file=$(zenity --entry --title="Nome do arquivo RAR" --text="Digite o nome do arquivo RAR a ser criado:" --entry-text="$suggested_name")

            if [ -z "$rar_file" ]; then
                zenity --error --text="Nome do arquivo RAR não fornecido. Operação cancelada."
            else
                pushd "$(dirname "$file")" && rar a "$rar_file.rar" "$(basename "$file")" && popd
                zenity --info --text="Arquivo $rar_file.rar criado com sucesso."
            fi
        fi
        ;;

    "Descompactar")
        archive=$(zenity --file-selection --title="Selecione o arquivo ZIP ou RAR para descompactar" --filename="$current_dir" --file-filter="*.zip *.rar")

        if [ -z "$archive" ]; then
            zenity --error --text="Nenhum arquivo selecionado. Operação cancelada."
        else
            destination_dir=$(zenity --file-selection --title="Selecione o diretório de destino para descompactar" --directory)

            if [[ $archive == *.zip ]]; then
                unzip "$archive" -d "$destination_dir"
            elif [[ $archive == *.rar ]]; then
                unrar x "$archive" "$destination_dir"
            fi

            zenity --info --text="Arquivo $archive descompactado com sucesso."
        fi
        ;;

    "Sair")
        exit 0
        ;;

    *)
        exit 0
        ;;
    esac
done
