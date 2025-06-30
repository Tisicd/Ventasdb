FROM postgres:15

COPY init.sql /docker-entrypoint-initdb.d/00-init.sql
COPY seed.sql /docker-entrypoint-initdb.d/01-seed.sql

