CREATE USER IF NOT EXISTS vector IDENTIFIED WITH sha256_password BY 'P@ssw0rd';

GRANT INSERT ON metrics TO vector;

GRANT INSERT ON logs TO vector;
