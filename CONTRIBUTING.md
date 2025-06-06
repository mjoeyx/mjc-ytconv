# Contributing to mjc-ytconv™

Pertama, terima kasih telah mempertimbangkan berkontribusi **mjc-ytconv™**! Dukungan Anda sangat berharga dalam membuat alat ini lebih berkembang dan mudah untuk pengguna.

## 🛠️ Memulai

1.  **Fork Repo** Klik "Fork" tombol di kanan atas [halaman repo](https://github.com/mjoeyx/mjc-ytconv).

2.  **Clone Fork Anda Sendiri**
    ```bash
    git clone https://github.com/your-username/mjc-ytconv.py
    cd mjc-ytconv
    ```

3.  **Set Up Environment**

    **Untuk Termux:**

    ```bash
    pkg update -y && pkg upgrade -y
    pkg install python git curl
    termux-setup-storage
    pip install -r requirements.txt
    ```

    **Untuk Linux (Ubuntu/Debian/Fedora/Arch):**

    ```bash
    sudo apt update && sudo apt install python3 python3-pip git curl -y
    pip3 install -r requirements.txt
    ```

4.  **Menjalankan**

    ```bash
    python mjc-ytconv.py
    ```