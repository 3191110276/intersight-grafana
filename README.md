# Grafana Dashboards for Cisco Intersight

This is a collection of dashboards for Cisco Intersight that can be imported into your own Grafana instance. The dashboards should help with various operational and troubleshooting tasks in Intersight. The process of getting the dashboards into your account is fairly simple. First, [import the dashboards](#Import-and-Export-of-Grafana-Elements), then [add a datasource](#Adding-a-Datasource). Both steps are described below in detail. If you have any feedback, [please raise an issue in this GitHub repository](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-an-issue).

## Import and Export of Grafana Elements

### Preparation
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

### Importing
If you want to import the Grafana elements into your instance, you can follow the steps below.

Step 1: Download or clone this repository to your local machine running Grizzly

Step 2: Run the following command to sync the files with Grafana
```
grr apply ./path/to/files
```
> [!CAUTION]
> The dashboards are still early in development. Please apply new versions periodically to fix issues as they are being discovered.

### Exporting
If you make changes to the dashboards that you want to share with the community, you can export your dashboards and create a pull request on this repository. To export elements from your Grafana instance, you can use the following commands:
```
grr config set-targets Dashboard,DashboardFolder
grr pull ./path/to/files
```
If your Grafana instance contains other dashboards, these would be exported as well. Please only create pull requests for those files that are related to this repository. To propose a pull request, please follow the [official guide](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

## Adding a Datasource
