
## YTConverter™

---
`mjc-ytconv` Tool berbasis Python project developed by [mjoeyx](https://github.com/mjoeyx) Dirancang untuk menyediakan tool mengubah video YouTube menjadi berbagai format. Tool ini menyederhanakan proses mengunduh dan mengonversi video dari YouTube.
---

## Requirements
- Python 3.x
- Diperlukan Python libraries (Lihat di `requirements.txt`)
- ffmpeg & yt-dlp binary


### Instalsi untuk Linux (Ubuntu/Debian/Fedora/Arch):
1. Install Python:
   ```bash
   sudo apt update && sudo apt install python3 python3-pip -y  # untuk Debian/Ubuntu
  
   sudo dnf install python3 python3-pip  # untuk Fedora
  
   sudo pacman -S python python-pip  # untuk Arch
   ```
2. Install Git dan Curl:
   ```bash
   sudo apt install git curl -y  # Debian/Ubuntu
   ```
3. Clone repo:
   ```bash
   git clone https://github.com/mjoeyx/mjc-ytconv.git
   cd mjc-ytconv
   ```
4. Install Python libraries yang diperlukan:
   ```bash
   pip3 install -r requirements.txt
   ```
## Instalasi (Termux/Linux-distros)
```bash
# Update Termux dan install Python
pkg update -y && pkg upgrade -y && pkg install python

# Install Git dan Curl
pkg install git
pkg install curl

# Clone repo
git clone https://github.com/mjoeyx/mjc-ytconv.git

# Izinkan perizinan penyimpanan
termux-setup-storage

# directory
cd mjc-ytconv

# Install dependencies
pip install -r requirements.txt
```

## Instalasi (Windows)

1. Download atau clone repo:

   ```powershell
   git clone https://github.com/mjoeyx/mjc-ytconv.git
   cd mjc-ytconv
2. Buka perintah prompt dan jalankan file batch penginstal `mjc-ytconv` directory:
```powershell
install.bat
```

3. Setelah instalasi, mulai program:
```powershell
python mjc-ytconv.py
```   
## Penggunaan
1. Jalankan script utama untuk memulai proses konversi:
   ```bash
   python mjc-ytconv.py
   ```
2. Ikuti instruksi di layar untuk memasukkan URL YouTube dan pilih format output yang diinginkan.

## Tested on
- Linux
- Termux
- Ubuntu
- MacOs
- Windows 10/11

---



## Developer
- t.me/mjoeyx

## Fitur
- **Video Downloading**: Ambil video langsung dari YouTube.
- **Audio Downloading**: Unduh audio video apa pun dengan berbagai pilihan bitrate.
- **Multiple video download**: Sekarang Anda dapat mengunduh beberapa video menggunakan tool ini, cukup tempel URL satu per satu.
- **Format Conversion**: Konversi video yang diunduh menjadi berbagai format seperti MP3, MP4, dll.
- **Metadata Handling**: Ekstrak dan kelola metadata yang terkait dengan video YouTube.

---


## Disclaimer ⚠⚠
 - **Kami meminta Anda untuk nama dan informasi kontak Anda di awal tool ini untuk pemberitahuan terkait pembaruan, tetapi jika Anda tidak menginginkan itu, Anda dapat mengabaikannya**
 - **Kami juga mengumpulkan beberapa informasi dasar tentang statistik penggunaan dan IP publik pengguna, tetapi kami meyakinkan Anda bahwa data ini tidak disimpan lebih dari 48 jam**
 - **Kami menghormati privasi Anda. Info dasar apa pun yang dikumpulkan tool ini (seperti data penggunaan) ditangani dengan aman dan tidak pernah dibagikan. Tidak ada pelacakan apapun.**
 - _Terimakasih Sudah Menggunakan Tool ini 😊_

---
