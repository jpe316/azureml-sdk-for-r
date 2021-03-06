% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workspace.R
\name{create_workspace}
\alias{create_workspace}
\title{Create a new Azure Machine Learning workspace}
\usage{
create_workspace(name, auth = NULL, subscription_id = NULL,
  resource_group = NULL, location = NULL,
  create_resource_group = TRUE, friendly_name = NULL,
  storage_account = NULL, key_vault = NULL, app_insights = NULL,
  container_registry = NULL, cmk_keyvault = NULL,
  resource_cmk_uri = NULL, hbi_workspace = FALSE, exist_ok = FALSE,
  show_output = TRUE, sku = "basic")
}
\arguments{
\item{name}{A string of the new workspace name. Workspace name has to be
between 2 and 32 characters of letters and numbers.}

\item{auth}{The \code{ServicePrincipalAuthentication} or \code{InteractiveLoginAuthentication}
object. For more details refer to https://aka.ms/aml-notebook-auth. If NULL,
the default Azure CLI credentials will be used or the API will prompt for credentials.}

\item{subscription_id}{A string of the subscription ID of the containing
subscription for the new workspace. The parameter is required if the user has
access to more than one subscription.}

\item{resource_group}{A string of the Azure resource group that is containing
the workspace. The parameter defaults to a mutation of the workspace name.}

\item{location}{A string of the location of the workspace. The parameter
defaults to the resource group location. The location has to be a supported
region for Azure Machine Learning Services.}

\item{create_resource_group}{If \code{TRUE} the resource group will be created
if it doesn't exist.}

\item{friendly_name}{A string of the friendly name for the workspace that
can be displayed in the UI.}

\item{storage_account}{A string of an existing storage account in the Azure
resource ID format. The storage will be used by the workspace to save run
outputs, code, logs etc. If \code{NULL} a new storage will be created.}

\item{key_vault}{A string of an existing key vault in the Azure resource ID
format. The key vault will be used by the workspace to store credentials
added to the workspace by the users. If \code{NULL} a new key vault will be
created.}

\item{app_insights}{A string of an existing Application Insights in the Azure
resource ID format. The Application Insights will be used by the workspace to
log webservices events. If \code{NULL} a new Application Insights will be created.}

\item{container_registry}{A string of an existing container registry in the
Azure resource ID format. The container registry will be used by the
workspace to pull and push both experimentation and webservices images. If
\code{NULL} a new container registry will be created.}

\item{cmk_keyvault}{A string representing the key vault containing the customer
managed key in the Azure resource ID format:
'/subscriptions//resourcegroups//providers/microsoft.keyvault/vaults/'. For
example: '/subscriptions/d139f240-94e6-4175-87a7-954b9d27db16/resourcegroups/myresourcegroup/providers/microsoft.keyvault/vaults/mykeyvault'.}

\item{resource_cmk_uri}{The key URI of the customer managed key to encrypt the data at rest.
The URI format is: 'https://<keyvault-dns-name>/keys/<key-name>/<key-version>'.
For example, 'https://mykeyvault.vault.azure.net/keys/mykey/bc5dce6d01df49w2na7ffb11a2ee008b'.
Refer to https://docs.microsoft.com/azure-stack/user/azure-stack-key-vault-manage-portal for steps on how
to create a key and get its URI.}

\item{hbi_workspace}{Specifies whether the customer data is of High Business
Impact(HBI), i.e., contains sensitive business information. The default value
is FALSE. When set to TRUE, downstream services will selectively disable logging.}

\item{exist_ok}{If \code{TRUE} the method will not fail if the workspace already
exists.}

\item{show_output}{If \code{TRUE} the method will print out incremental progress
of method.}

\item{sku}{A string indicating if the workspace will be "basic" or
"enterprise" edition.}
}
\value{
The \code{Workspace} object.
}
\description{
Create a new Azure Machine Learning workspace. Throws an exception if the
workspace already exists or any of the workspace requirements are not
satisfied. When you create new workspace, it automatically creates several
Azure resources that are used in the workspace:
\itemize{
\item Azure Container Registry: Registers Docker containers that you use during
training and when you deploy a model. To minimize costs, ACR is
lazy-loaded until deployment images are created.
\item Azure Storage account: Used as the default datastore for the workspace.
\item Azure Application Insights: Stores monitoring information about your
models.
\item Azure Key Vault: Stores secrets that are used by compute targets and other
sensitive information that's needed by the workspace.
}
}
\examples{
# This example requires only minimal specification, and all dependent
# resources as well as the resource group will be created automatically.
\dontrun{
ws <- create_workspace(name = 'myworkspace',
                       subscription_id = '<azure-subscription-id>',
                       resource_group = 'myresourcegroup',
                       location = 'eastus2')
}

# This example shows how to reuse existing Azure resources by making
# use of all parameters utilizing the Azure resource ID format. The specific
# Azure resource IDs can be retrieved through the Azure Portal or SDK. This
# assumes that the resource group, storage account, key vault, App Insights
# and container registry already exist
\dontrun{
prefix = "subscriptions/<azure-subscription-id>/resourcegroups/myresourcegroup/providers/"
ws <- create_workspace(
       name = 'myworkspace',
       subscription_id = '<azure-subscription-id>',
       resource_group = 'myresourcegroup',
       create_resource_group = FALSE,
       location = 'eastus2',
       friendly_name = 'My workspace',
       storage_account = paste0(prefix, 'microsoft.storage/storageaccounts/mystorageaccount'),
       key_vault = paste0(prefix, 'microsoft.keyvault/vaults/mykeyvault'),
       app_insights = paste0(prefix, 'microsoft.insights/components/myappinsights'),
       container_registry = paste0(
         prefix,
         'microsoft.containerregistry/registries/mycontainerregistry'))
}
}
\seealso{
\code{\link{service_principal_authentication}}
\code{\link{get_workspace}}
\code{\link{interactive_login_authentication}}
}
