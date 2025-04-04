# Grafana Dashboards for Cisco Intersight

This is a collection of dashboards for Cisco Intersight that can be imported into your own Grafana instance. The dashboards should help with various operational and troubleshooting tasks in Intersight. The process of getting the dashboards into your account is fairly simple. First, [parepare your Grafana environment](#Preparing-your-Grafana-environment), then [import the dashboards](#Import-and-Export-of-Grafana-elements). Both steps are described below in detail. If you have any feedback, [please raise an issue in this GitHub repository](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-an-issue).

> [!CAUTION]
> The dashboards are in early development. Please apply new versions periodically to fix known issues.

## Preparing your Grafana environment
Before you can import the dashboards into your environment, there are a few preparation steps that you need to take. You will need a current Grafana instance with the two following actions done:
* [Install the required plugins](#Adding-Plugins)
* [Add a Data Source pointing to your Intersight account](#Adding-a-Data-Source)

### Adding Plugins
Your Grafana needs to have the following two plugins installed:
* [Infinity Data Source Plugin](https://grafana.com/grafana/plugins/yesoreyeram-infinity-datasource/?tab=installation)
* [Business Text Plugin](https://grafana.com/grafana/plugins/marcusolsson-dynamictext-panel/?tab=installation)

Pleae follow the official guides to install them in your environment.

### Adding a Data Source
Data can be queried directly from your Intersight instance by setting up the Data Source correctly. Follow the steps below to create one Data Source per Intersight account/appliance you want to monitor from Grafana:

Step 1: Add a new "Infinity" Data Source. If your Grafana instance does not have this Data Source available, you first have to add it using the [installation instructions](https://grafana.com/grafana/plugins/yesoreyeram-infinity-datasource/?tab=installation).

Step 2: Create an OAuth2 Token in Intersight. You should use a read-only account when creating this token to limit the permissions granted to the OAuth2 Token.

Step 3: Return to Grafana, switch to the "Authentication" section, and select OAuth2 as the authentication mechanism for the "Infinity" Data Source.

Step 4: Add your Client ID and Client Secret that you got from Intersight.

Step 5: Add the Token URL based on your environment.
* US SaaS: https://intersight.com/iam/token
* EU SaaS: https://eu-central-1.intersight.com/iam/token
* Appliance: https://&lt;appliance-fqdn>/iam/token

Step 6: Fill in the Intersight URL in the "Allowed Hosts" field:
* US SaaS: https://intersight.com
* EU SaaS: https://eu-central-1.intersight.com
* Appliance: https://&lt;appliance-fqdn>

Step 7: Switch to the "URL, Headers & Params" section. Populate the "Base URL" field. The value should be identical to the one you provided in Step 6.

Step 8: Save the Data Source. You should now be able to us this account/appliance in Grafana, including the imported dashboards.

## Import and Export of Grafana elements

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
grr apply ./path/to/grafana_elements
```

### Exporting
If you make changes to the dashboards that you want to share with the community, you can export your dashboards and create a pull request on this repository. To export elements from your Grafana instance, you can use the following commands:
```
grr config set-targets Dashboard,DashboardFolder
grr pull ./path/to/grafana_elements
```
If your Grafana instance contains other dashboards, these would be exported as well. Please only create pull requests for those files that are related to this repository. To propose a pull request, please follow the [official guide](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).
