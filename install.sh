#!/usr/bin/env bash

CHECK="✅"
CROSS="❌"
INFO="ℹ️"
STAR="✨"

# ANSI colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Cek pendukung warna
supports_color() {
    if [ -t 1 ] && [ -n "$TERM" ] && [ "$TERM" != "dumb" ]; then
        return 0
    else
        GREEN=''; RED=''; YELLOW=''; CYAN=''; RESET=''
    fi
}

detect_os() {
    if [ -f /data/data/com.termux/files/usr/bin/pkg ]; then
        echo "termux"
    elif [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian) echo "debian" ;;
            kali) echo "kali" ;;
            arch|manjaro) echo "arch" ;;
            *) echo "Tidak dikenal" ;;
        esac
    else
        echo "Tidak dikenal"
    fi
}

detect_sudo() {
    if command -v sudo >/dev/null 2>&1; then
        echo "sudo"
    else
        echo ""
    fi
}

install_system_packages() {
    local os=$1
    local sudo_cmd=$2

    echo -e "${INFO} ${CYAN}OS Terdeteksi: $os${RESET}"

    case "$os" in
        termux)
            pkg update -y && pkg install -y python ffmpeg yt-dlp || {
                echo -e "${CROSS} ${RED}Gagal install paket di Termux.${RESET}"
                exit 1
            }
            ;;
        debian|kali)
            $sudo_cmd apt update && $sudo_cmd apt install -y python3 python3-pip ffmpeg yt-dlp || {
                echo -e "${CROSS} ${RED}Gagal install paket di Debian-based system.${RESET}"
                exit 1
            }
            ;;
        arch)
            $sudo_cmd pacman -Sy --noconfirm python python-pip ffmpeg yt-dlp || {
                echo -e "${CROSS} ${RED}Gagal install paket di Arch-based system.${RESET}"
                exit 1
            }
            ;;
        *)
            echo -e "${YELLOW}${INFO} OS tidak didukung. Mencoba pengaturan minimal...${RESET}"
            command -v python3 >/dev/null || echo -e "${CROSS} ${YELLOW}Install Python 3 manual."
            command -v pip3 >/dev/null || {
                echo -e "${INFO} ${YELLOW}Mencoba install pip...${RESET}"
                curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py
                python3 get-pip.py || echo -e "${CROSS} ${RED}Gagal install pip.${RESET}"
            }
            command -v ffmpeg >/dev/null || echo -e "${YELLOW}${INFO} Install ffmpeg manual.${RESET}"
            command -v yt-dlp >/dev/null || echo -e "${YELLOW}${INFO} Coba: pip3 install yt-dlp${RESET}"
            ;;
    esac
}

install_python_packages() {
    echo -e "\n${INFO} ${CYAN}Menginstal beberapa paket Python...${RESET}"
    PIP_CMD="pip3"
    command -v pip3 >/dev/null || PIP_CMD="pip"

    if [ "$os_type" != "termux" ]; then
        $PIP_CMD install --upgrade pip || {
            echo -e "${CROSS} ${RED} Upgrade pip gagal.${RESET}"
            exit 1
        }
    else
        echo -e "${YELLOW}${INFO} Melewati pip upgrade pada Termux untuk menghindari breaking..${RESET}"
    fi

    $PIP_CMD install --upgrade yt_dlp fontstyle colored requests || {
        echo -e "${CROSS} ${RED}Paket Python Gagal di Instalasi.${RESET}"
        exit 1
    }
}

main() {
    supports_color
    echo -e "${STAR} ${GREEN}Memulai YTConverter™ Pemasang Universal...${RESET}"

    os_type=$(detect_os)
    sudo_cmd=$(detect_sudo)

    install_system_packages "$os_type" "$sudo_cmd"
    install_python_packages

    echo -e "\n${CHECK} ${GREEN}Instalasi Selesai! sekarang Anda bisa menjalankan YTConverter™.${RESET}"
    echo -e "${INFO} ${CYAN}Untuk memulai: Jalankan 'python ytconverter.py'.${RESET}"
}

main
