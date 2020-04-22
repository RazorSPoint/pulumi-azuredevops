module github.com/pulumi/pulumi-azuredevops

go 1.13

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v12.4.3+incompatible

replace github.com/microsoft/terraform-provider-azuredevops => github.com/tiwood/terraform-provider-azuredevops v1.0.0-build

require (
	github.com/hashicorp/terraform-plugin-sdk v1.8.0
	github.com/microsoft/terraform-provider-azuredevops v0.1.0
	github.com/pkg/errors v0.8.1
	github.com/pulumi/pulumi v1.8.0
	github.com/pulumi/pulumi-terraform-bridge v1.5.2
)
