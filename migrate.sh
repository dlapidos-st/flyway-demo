#!/bin/bash

docker run \
    --rm \
    --env-file ./postgres.env \
    --network flyway-demo_flyway-network \
    --volume ${PWD}/flyway/conf/:/flyway/conf/ \
    --volume ${PWD}/flyway/sql/:/flyway/sql/ \
    flyway/flyway:8.3.0 \
    migrate



#docker build -t flyway-sample:local ./flyway
#docker run --rm --env-file ./postgres.env --network flyway-demo_flyway-network flyway-sample:local 