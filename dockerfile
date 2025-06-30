FROM postgres:15

COPY init.sql /docker-entrypoint-initdb.d/
COPY seed.sql /docker-entrypoint-initdb.d/

# El entrypoint oficial de Postgres ejecuta automáticamente
# todos los scripts *.sql dentro de /docker-entrypoint-initdb.d/ al iniciar el contenedor.

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123
ENV POSTGRES_DB=ventasdb