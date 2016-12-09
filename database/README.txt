MySQL commands -

mysql -u root -p

CREATE DATABASE language_comparison;
USE language_comparison;
CREATE USER 'guest'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'guest'@'localhost';

source ~/code/language_comparison/database/db.sql