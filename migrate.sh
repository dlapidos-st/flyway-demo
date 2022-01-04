#!/bin/bash

docker build -t flyway-sample:local ./flyway
docker run --env-file ./postgres.env --network flyway-demo_flyway-network flyway-sample:local 