#!/usr/bin/env bash


GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m"


CHECK="✅"
CROSS="❌"
WARN="⚠️"
INFO="ℹ️"
SPARK="✨"
FOLDER="📂"

if [[ "$PREFIX" == *"com.termux"* ]]; then
    echo -e "${INFO} Environment Termux Terdeteksi."
    home_dir="$HOME"
else
    echo -e "${INFO} Environment Linux Terdeteksi."
    home_dir="$HOME"
fi

project_dir="$home_dir/ytconverter"
backup_dir="$home_dir/bytconverter"

echo -e "${FOLDER} Mengubah ke Direktori Home..."
cd "$home_dir" || { echo -e "${CROSS} ${RED}Gagal mengubah directory.${NC}"; exit 1; }

if [ -d "$project_dir" ]; then
    echo -e "${WARN} Ditemukan ytconverter. Backing it up..."
    mv "$project_dir" "$backup_dir"
fi

echo -e "${INFO} Mengkloning versi terbaru dari ytconverter..."
if git clone https://github.com/kaifcodec/ytconverter.git; then
    echo -e "${CHECK} ${GREEN}Kloning Berhasil.${NC}"
else
    echo -e "${CROSS} ${RED}Gagal mengkloning repo.${NC}"
    if [ -d "$backup_dir" ]; then
        mv "$backup_dir" "$project_dir"
        echo -e "${WARN} Cadangan yang Dipulihkan."
    fi
    exit 1
fi

if [ -d "$backup_dir" ]; then
    echo -e "${INFO} Cadangan dihapus..."
    rm -rf "$backup_dir"
fi

echo -e "${SPARK} Memperbarui yt-dlp..."
if pip install --force-reinstall --no-deps yt-dlp; then
    echo -e "${CHECK} ${GREEN}yt-dlp Selesai diperbarui.${NC}"
else
    echo -e "${CROSS} ${RED}yt-dlp update failed.${NC}"
    exit 1
fi

echo -e "\n${CHECK} ${GREEN}Update Selesai!${NC}"
echo -e "${FOLDER} Berubah menjadi ytconverter directori..."
cd ytconverter || { echo -e "${CROSS} ${RED}Gagal masuk ke ytconverter directory.${NC}"; exit 1; }

exec bash
