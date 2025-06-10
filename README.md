# Grafana Dashboards for Cisco Intersight

This is a collection of dashboards for Cisco Intersight that can be imported into your own Grafana instance. The dashboards should help with various operational and troubleshooting tasks in Intersight.

> [!CAUTION]
> The dashboards are in early development. Please apply new versions periodically to fix known issues.

## Importing the dashboards
You can install these dashboards in your environment using:
- [Docker-based installation](/deploy/manual/)
- [Manual import of dashboards in an existing Grafana instance](/deploy/docker/)

## Adding a Data Source
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

Step 8: Toggle "Encode query parameters with %20" to ensure that the setting is active.

Step 9: Save the Data Source. You should now be able to us this account/appliance in Grafana, including the imported dashboards.
