FROM postgres:15

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123
ENV POSTGRES_DB=ventasdb

COPY init.sql /docker-entrypoint-initdb.d/
COPY seed.sql /docker-entrypoint-initdb.d/