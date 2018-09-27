FROM postgres:9.4-alpine

USER postgres

COPY /src/main/resources/scripts/bootstrap/create-iws-db.sh /docker-entrypoint-initdb.d/