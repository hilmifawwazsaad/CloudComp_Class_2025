# Case 4 - Automated Data Collection & Storage System

## 📋 Deskripsi
Sistem otomatis yang melakukan download jokes dari API Chuck Norris dan menyimpan ke MySQL database secara periodik menggunakan Docker containers.

## 🎯 Skenario Use Case

Sistem ini cocok untuk:
- **Data Aggregation**: Mengumpulkan data dari API eksternal secara berkala
- **Content Collection**: Backup konten dari third-party services  
- **Monitoring**: Tracking data changes over time
- **Price Tracking**: Monitor harga produk dari e-commerce
- **IoT Data**: Collect sensor data periodically

## 🏗️ Arsitektur

### Komponen:
1. **MySQL Database (mysql1)** - Menyimpan data jokes
2. **Data Collector (myprocess1)** - Alpine container yang download jokes setiap 8 detik
3. **phpMyAdmin (phpmyadmin1)** - Web interface untuk database management

### Data Flow:
```
API → Alpine Container → MySQL Database → phpMyAdmin
     (curl + jq)        (INSERT)          (View)
```

## 📂 Struktur File

```
case4/
├── main.sh                  # Start semua services
├── stop.sh                  # Stop semua services  
├── verify.sh                # Verification script
├── show_architecture.sh     # Display architecture diagram
├── README.md                # Dokumentasi utama
├── ARCHITECTURE.md          # Detail arsitektur
├── TECHNICAL_DETAILS.md     # Technical specifications
├── SCREENSHOT_GUIDE.md      # Panduan screenshot untuk laporan
├── database/
│   ├── init.sql            # Database initialization
│   ├── run_mysql.sh        # Start MySQL container
│   ├── run_myadmin.sh      # Start phpMyAdmin container
│   └── dbdata/             # MySQL data (persistent volume)
├── script/
│   ├── getjokes.sh         # Data collection script
│   └── run_process.sh      # Start collector container
└── views/                   # (not used in this version)
```

## 🚀 Cara Menjalankan

### Start semua services:
```bash
cd /home/hfwxyz/cc25/task-1/case4
sudo bash ./main.sh
```

### Stop semua services:
```bash
cd /home/hfwxyz/cc25/task-1/case4
sudo bash ./stop.sh
```

### Verifikasi sistem:
```bash
sudo bash ./verify.sh
```

### Lihat arsitektur:
```bash
./show_architecture.sh
```

## 🔍 Monitoring

### Cek log download script:
```bash
sudo docker logs -f myprocess1
```

### Cek data di database:
```bash
sudo docker exec -it mysql1 mysql -uroot -pmydb6789tyui mydb \
  -e "SELECT * FROM jokes ORDER BY created_at DESC LIMIT 10;"
```

### Cek jumlah total jokes:
```bash
sudo docker exec -it mysql1 mysql -uroot -pmydb6789tyui mydb \
  -e "SELECT COUNT(*) as total_jokes FROM jokes;"
```

### Akses phpMyAdmin:
- URL: http://localhost:10000
- Server: mysql1
- Username: root
- Password: mydb6789tyui

## 📊 Database Schema

```sql
Database: mydb
Table: jokes

Columns:
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- joke_text (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
```

## 🐳 Container Details

### Container 1: mysql1
- **Image**: mysql:8.0-debian
- **Purpose**: Database server
- **Port**: 3306 (internal)
- **Volume**: ./database/dbdata:/var/lib/mysql

### Container 2: myprocess1
- **Image**: alpine:3.18
- **Purpose**: Data collector
- **Frequency**: Every 8 seconds
- **API**: https://api.chucknorris.io/jokes/random

### Container 3: phpmyadmin1
- **Image**: phpmyadmin:5.2.1-apache
- **Purpose**: Web GUI
- **Port**: 10000:80

## 📸 Screenshot untuk Laporan

Lihat file `SCREENSHOT_GUIDE.md` untuk panduan lengkap pengambilan screenshot.

Minimal screenshots yang diperlukan:
1. Start system process
2. Architecture diagram  
3. Container status
4. Collector logs
5. Database verification
6. phpMyAdmin login
7. phpMyAdmin data view
8. Verification output
9. Stop system

## ✅ Verifikasi Sistem Berjalan

Jalankan command berikut untuk memastikan semua berjalan:

```bash
# 1. Cek container running
sudo docker ps | grep -E "mysql1|myprocess1|phpmyadmin1"

# 2. Cek collector working
sudo docker logs myprocess1 | tail -5

# 3. Cek data di database
sudo docker exec mysql1 mysql -uroot -pmydb6789tyui mydb \
  -e "SELECT COUNT(*) FROM jokes;"

# 4. Test phpMyAdmin access
curl -I http://localhost:10000
```

## 🔧 Troubleshooting

### Container tidak start?
```bash
sudo docker logs mysql1
sudo docker logs myprocess1
```

### Database error?
```bash
# Reset database
sudo docker rm -f mysql1
sudo rm -rf database/dbdata
sudo bash main.sh
```

### Port 10000 sudah dipakai?
Edit `database/run_myadmin.sh` dan ganti port:
```bash
-p 10001:80  # ganti 10000 ke 10001
```

## 📚 Dokumentasi Tambahan

- `ARCHITECTURE.md` - Penjelasan detail arsitektur dan use cases
- `TECHNICAL_DETAILS.md` - Spesifikasi teknis, schema, monitoring
- `SCREENSHOT_GUIDE.md` - Panduan screenshot untuk laporan

## 🎓 Learning Points

1. **Docker Containers** - Multi-container orchestration
2. **Data Persistence** - Using volumes for permanent storage
3. **API Integration** - RESTful API consumption
4. **Database Operations** - SQL INSERT and queries
5. **Automation** - Periodic task scheduling
6. **Monitoring** - Logging and health checking
7. **Shell Scripting** - Process automation

## 👨‍💻 Author

Created for CC25 Task-1 Case-4
Date: December 2025
