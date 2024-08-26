import discord/application/install_params.{type InstallParams}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/application#application-object-application-integration-type-configuration-object
pub type ApplicationIntegrationTypeConfiguration {
  IntegrationTypeConfiguration(oauth2_install_params: Option(InstallParams))
}
