CREATE USER IF NOT EXISTS grafana IDENTIFIED WITH sha256_password BY 'P@ssw0rd';

GRANT SELECT ON metrics TO grafana;

GRANT SELECT ON logs TO grafana;
