# Docker

This example Dockerfile can be used to quickly spin up an instance with the latest dashboards for testing purposes.

To build the container:
```
docker build -t intersight-grafana .
```

To run the container:
```
docker run -d -p 3000:3000 intersight-grafana 
```
