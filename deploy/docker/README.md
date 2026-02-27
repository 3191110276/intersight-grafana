# Docker Deployment

This example Dockerfile can be used to quickly spin up an instance with the latest dashboards for testing purposes.

> [!NOTE]  
> When running on a Mac with Apple Silicon, you may have to change "grr-linux-amd64" to "grr-linux-arm64" in the Dockerfile

To build the container:
```
docker build -t intersight-grafana .
```
or
```
podman build -t intersight-grafana .
```

To run the container:
```
docker run -d -p 3000:3000 intersight-grafana 
```
or
```
podman run -d -p 3000:3000 intersight-grafana
```

The login information for the first time:<br />
Username: admin<br />
Password: admin

After starting the container for the first time, [configure the datasource for your Intersight environment](../..//README.md?tab=readme-ov-file#adding-a-data-source)
