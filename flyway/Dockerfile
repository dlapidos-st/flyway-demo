FROM flyway/flyway:8.3.0

COPY flyway.conf /flyway/conf/flyway.conf
COPY ./sql/ /flyway/sql/
COPY ./docker-entrypoint.sh /flyway/docker-entrypoint.sh

USER root
RUN chmod +x /flyway/docker-entrypoint.sh

USER flyway
ENTRYPOINT [ "/flyway/docker-entrypoint.sh" ]
