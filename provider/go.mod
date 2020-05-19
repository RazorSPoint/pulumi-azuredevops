module github.com/pulumi/pulumi-azuredevops/provider

go 1.13

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v12.4.3+incompatible

replace github.com/microsoft/terraform-provider-azuredevops => github.com/tiwood/terraform-provider-azuredevops v1.7.1-build

require (
	github.com/hashicorp/terraform-plugin-sdk v1.10.0
	github.com/microsoft/terraform-provider-azuredevops v0.1.0
	github.com/pulumi/pulumi-terraform-bridge/v2 v2.0.0
	github.com/pulumi/pulumi/sdk/v2 v2.2.1
)
