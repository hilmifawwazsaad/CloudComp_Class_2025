# Case 4 - Automated Data Collection & Storage System

## 📋 Deskripsi

Sistem otomatis yang melakukan pengambilan data dari API eksternal dan menyimpannya ke database MySQL secara berkala. Sistem ini menggunakan container Docker untuk isolasi dan portabilitas.

## 🎯 Kapan Skenario Ini Penting/Cocok Dilakukan

### Use Cases yang Cocok:

1. **Data Aggregation & Monitoring**
   - Mengumpulkan data dari multiple API secara periodik
   - Monitoring metrics dari external services
   - Collecting social media feeds atau news data

2. **Price Tracking & Comparison**
   - Tracking harga produk dari e-commerce
   - Cryptocurrency price monitoring
   - Stock market data collection

3. **Weather & IoT Data Collection**
   - Periodic weather data collection
   - Sensor data aggregation
   - Environmental monitoring

4. **Content Aggregation**
   - RSS feed aggregation
   - News article collection
   - Social media content backup

5. **API Data Backup**
   - Regular backup dari third-party services
   - Historical data preservation
   - Audit trail creation

### Keuntungan Arsitektur Ini:

✅ **Automated** - Tidak perlu intervensi manual  
✅ **Scalable** - Mudah di-scale dengan menambah container  
✅ **Isolated** - Setiap service dalam container terpisah  
✅ **Persistent** - Data tersimpan permanent di database  
✅ **Maintainable** - Mudah di-maintain dan di-debug  
✅ **Portable** - Bisa di-deploy di environment manapun dengan Docker

## 🏗️ Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────────────┐
│                         HOST SYSTEM                             │
│                                                                 │
│  ┌────────────────────┐         ┌─────────────────────────┐   │
│  │   Alpine Container │         │   MySQL Container       │   │
│  │   (myprocess1)     │         │   (mysql1)              │   │
│  │                    │         │                         │   │
│  │  ┌──────────────┐  │  Link   │  ┌──────────────────┐  │   │
│  │  │ getjokes.sh  │  │◄───────►│  │  MySQL Server    │  │   │
│  │  │              │  │         │  │  Port: 3306      │  │   │
│  │  │ • curl       │  │         │  │                  │  │   │
│  │  │ • jq         │  │         │  │  Database: mydb  │  │   │
│  │  │ • mysql-cli  │  │         │  │  Table: jokes    │  │   │
│  │  └──────────────┘  │         │  └──────────────────┘  │   │
│  │         │           │         │          │             │   │
│  │         │ Every 8s  │         │          │             │   │
│  │         ▼           │         │          ▼             │   │
│  │  1. GET Request     │         │   Persistent Storage   │   │
│  │     to API          │         │   /var/lib/mysql       │   │
│  │  2. Parse JSON      │         │          │             │   │
│  │  3. INSERT to DB    │         │          │             │   │
│  └────────────────────┘         │  ┌───────▼──────────┐  │   │
│           │                      │  │  Volume Mount    │  │   │
│           │                      │  │  ./dbdata        │  │   │
│           │                      │  └──────────────────┘  │   │
│           │                      └─────────────────────────┘   │
│           │                                  │                 │
│           │                      ┌───────────┘                 │
│           │                      │                             │
│           │          ┌───────────▼───────────────┐             │
│           │          │  phpMyAdmin Container     │             │
│           │          │  (phpmyadmin1)            │             │
│           │          │                           │             │
│           │          │  Port: 10000 → 80         │             │
│           │          │  Web Interface            │             │
│           │          └───────────────────────────┘             │
│           │                      │                             │
│           ▼                      ▼                             │
│    ┌──────────────────────────────────────┐                   │
│    │    External API                      │                   │
│    │    https://api.chucknorris.io        │                   │
│    └──────────────────────────────────────┘                   │
│                                                                 │
│    Access Points:                                              │
│    • phpMyAdmin: http://localhost:10000                        │
│    • MySQL CLI: docker exec -it mysql1 mysql ...              │
└─────────────────────────────────────────────────────────────────┘

DATA FLOW:
──────────
1. Alpine Container mengambil data dari Chuck Norris API setiap 8 detik
2. Data JSON di-parse menggunakan jq
3. Data di-insert ke MySQL database melalui mysql-client
4. Data tersimpan persistent di volume ./dbdata
5. User bisa monitoring via phpMyAdmin atau MySQL CLI
