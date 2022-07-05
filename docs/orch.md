# Orchestration

In this section I'll present technique to setup a cockroach cluster.

## Local cluster using docker-compose

The technique discussed here is based on [this](https://www.cockroachlabs.com/docs/stable/start-a-local-cluster.html). You will find a local cluster in [./deployment/docker-compose.yml](../deployment/docker-compose.yml) comprising three db servers (roach1, roach2 and roach3).

Use [./scripts/compose.sh](../scripts/compose.sh) to initialise, start and stop the cluster. To access the cluster's administrative console, open a browser and target `http://localhost:8080`.