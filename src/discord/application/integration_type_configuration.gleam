import discord/application/install_params.{type InstallParams}
import gleam/option.{type Option}

pub type ApplicationIntegrationTypeConfiguration {
  IntegrationTypeConfiguration(oauth2_install_params: Option(InstallParams))
}
