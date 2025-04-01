# Grafana Dashboards for Cisco Intersight

## Preparation
Grafana's native import/export functionality is limited, thus we are using  [Grizzly](https://grafana.github.io/grizzly). This tool will have to be installed using the [official guide](https://grafana.github.io/grizzly/installation/). There is no Windows support yet, thus you have to use WSL (Windows Subsystem for Linux), if you want to run this tool on your Windows machine. After you have intalled it, you can follow these steps to set it up:

Step 1: Add your Grafana host to the Grizzly configuration
```
grr config set grafana.url https://YOUR_GRAFANA_URL
```

Step 2: Create a Service Account in Grafana using the [official guide](https://grafana.com/docs/grafana/latest/administration/service-accounts/#create-a-service-account-in-grafana)

Step 3: Add a token to your Grafana Service Account using the [official guide](https://grafana.com/docs/grafana/latest/administration/service-accounts/#add-a-token-to-a-service-account-in-grafana)

Step 4: Add your Service Account token to the Grizzly configuration
```
grr config set grafana.token YOUR_GRAFANA_TOKEN
```
Now you should be ready to import and export content from your Grafana instance.

## Importing
If you want to import the Grafana elements into your instance, you can follow the steps below.

Step 1: Download or clone this repository to your local machine running Grizzly

Step 2: Run the following command to sync the files with Grafana
```
grr apply ./path/to/files
```
> [!CAUTION]
> The dashboards are still early in development. Please check back again from time to time and apply new versions to receive all fixes for the dashboards.

## Exporting
