FROM postgres:10.5

USER postgres

COPY /src/main/resources/scripts/bootstrap/create-iws-db.sh /docker-entrypoint-initdb.d/
