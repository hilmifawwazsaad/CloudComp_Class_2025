CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Alter root user to use mysql_native_password for compatibility with MariaDB client
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'mydb6789tyui';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mydb6789tyui';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS jokes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    joke_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
