# 📚 Case 4 - Documentation Index

Panduan lengkap untuk memahami, menjalankan, dan mendokumentasikan sistem.

## 🗂️ File Dokumentasi

### 1. **README.md** - Dokumentasi Utama
- Overview sistem
- Quick start guide
- Commands untuk menjalankan
- Troubleshooting
- **Baca ini pertama!**

### 2. **ARCHITECTURE.md** - Arsitektur Sistem
- Penjelasan use cases kapan sistem ini cocok digunakan
- Diagram arsitektur lengkap
- Data flow explanation
- Container architecture details
- **Untuk laporan: Use Case & Arsitektur**

### 3. **TECHNICAL_DETAILS.md** - Spesifikasi Teknis
- Database schema detail
- Process flow diagram
- Container specifications
- Security considerations
- Monitoring & maintenance guide
- Backup & scaling procedures
- **Untuk laporan: Detail Teknis**

### 4. **SCREENSHOT_GUIDE.md** - Panduan Screenshot
- Step-by-step pengambilan screenshot
- 9+ screenshots untuk laporan
- Penjelasan untuk setiap screenshot
- Tips & best practices
- **Untuk laporan: Screenshot & Evidence**

## 🛠️ File Executable

### 5. **main.sh** - Start System
```bash
sudo bash ./main.sh
```
- Menjalankan MySQL container
- Menjalankan phpMyAdmin container  
- Menjalankan collector script
- Menampilkan status dan access info

### 6. **stop.sh** - Stop System
```bash
sudo bash ./stop.sh
```
- Menghentikan semua containers
- Membersihkan resources

### 7. **verify.sh** - Verification Script
```bash
sudo bash ./verify.sh
```
- Cek status containers
- Verify database connection
- Show statistics
- Display logs
- Resource usage
- **Gunakan untuk screenshot verification!**

### 8. **show_architecture.sh** - Display Architecture
```bash
./show_architecture.sh
```
- Menampilkan ASCII diagram arsitektur
- Data flow visualization
- Component details
- **Gunakan untuk screenshot arsitektur!**

## 📁 Direktori

### 9. **database/** - Database Files
- `init.sql` - Table creation script
- `run_mysql.sh` - Start MySQL container
- `run_myadmin.sh` - Start phpMyAdmin container
- `dbdata/` - Persistent data storage (auto-created)

### 10. **script/** - Collector Scripts
- `getjokes.sh` - Main collection logic
- `run_process.sh` - Start collector container

## 📋 Checklist untuk Laporan

### ✅ Penjelasan Use Case (dari ARCHITECTURE.md)
- [ ] Kapan skenario ini penting
- [ ] Use cases yang cocok
- [ ] Keuntungan arsitektur
- [ ] Real-world applications

### ✅ Gambar Arsitektur
- [ ] Screenshot dari `show_architecture.sh`
- [ ] Diagram data flow
- [ ] Container relationships
- [ ] Component details

### ✅ Script yang Mendukung
- [ ] `main.sh` - Automation start
- [ ] `stop.sh` - Automation stop
- [ ] `verify.sh` - Verification
- [ ] `getjokes.sh` - Core logic
- [ ] `init.sql` - Database setup

### ✅ Screenshot & Penjelasan (dari SCREENSHOT_GUIDE.md)
- [ ] Start system
- [ ] Architecture diagram
- [ ] Container status
- [ ] Collector logs
- [ ] Database data
- [ ] phpMyAdmin login
- [ ] phpMyAdmin data view
- [ ] Verification output
- [ ] Stop system

## 🎯 Workflow untuk Membuat Laporan

### Step 1: Pahami Sistem
```bash
# Baca dokumentasi
cat README.md
cat ARCHITECTURE.md
cat TECHNICAL_DETAILS.md
```

### Step 2: Jalankan Sistem
```bash
# Start semua services
sudo bash ./main.sh

# Tunggu 1-2 menit untuk collect data
sleep 120
```

### Step 3: Ambil Screenshots
```bash
# Ikuti SCREENSHOT_GUIDE.md
# Ambil minimal 9 screenshots yang diperlukan
```

### Step 4: Verifikasi
```bash
# Run verification
sudo bash ./verify.sh

# Screenshot output ini!
```

### Step 5: Stop System
```bash
# Stop semua
sudo bash ./stop.sh
```

## 📝 Template Penjelasan untuk Laporan

### Use Case Section:
```
Sistem ini mengimplementasikan automated data collection yang cocok untuk:
[copy dari ARCHITECTURE.md - section "Kapan Skenario Ini Penting"]

Keuntungan:
[copy dari ARCHITECTURE.md - section "Keuntungan Arsitektur"]
```

### Arsitektur Section:
```
Sistem terdiri dari 3 komponen utama dalam Docker containers:
[paste screenshot dari show_architecture.sh]

Penjelasan:
[copy dari ARCHITECTURE.md - section "Arsitektur Sistem"]
```

### Script Section:
```
Implementasi menggunakan beberapa script automation:
1. main.sh - [penjelasan]
2. stop.sh - [penjelasan]
3. getjokes.sh - [penjelasan]
4. verify.sh - [penjelasan]

[paste code snippets dari files]
```

### Screenshot Section:
```
[Untuk setiap screenshot, gunakan penjelasan dari SCREENSHOT_GUIDE.md]
```

## 🔗 Quick Links

- Start: `sudo bash ./main.sh`
- Stop: `sudo bash ./stop.sh`
- Verify: `sudo bash ./verify.sh`
- Architecture: `./show_architecture.sh`
- phpMyAdmin: http://localhost:10000
- Logs: `sudo docker logs -f myprocess1`

## 📞 Support

Jika ada masalah, cek:
1. Container status: `sudo docker ps -a`
2. Logs: `sudo docker logs [container_name]`
3. Troubleshooting section di README.md

---

**Last Updated**: December 2025
**Version**: 1.0
