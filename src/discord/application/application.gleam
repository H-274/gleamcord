import discord/application/application_flag.{type ApplicationFlag}
import discord/application/install_params.{type InstallParams}
import discord/application/integration_type.{type ApplicationIntegrationType}
import discord/application/integration_type_configuration.{
  type ApplicationIntegrationTypeConfiguration,
}
import discord/guild.{type Guild}
import discord/snowflake.{type Snowflake}
import discord/team.{type Team}
import discord/user.{type User}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

pub type Appliction {
  Application(
    id: Snowflake,
    name: String,
    icon: Option(String),
    description: String,
    rpc_origins: Option(List(String)),
    bot_public: Bool,
    bot_require_code_grant: Bool,
    bot: Option(User),
    terms_of_service_url: Option(String),
    privacy_policy_url: Option(String),
    owner: Option(User),
    summary: String,
    verify_key: String,
    team: Option(Team),
    guild_id: Option(Snowflake),
    guild: Option(Guild),
    primary_sku_id: Option(Snowflake),
    slug: Option(String),
    cover_image: Option(String),
    flags: Option(List(ApplicationFlag)),
    approximate_guild_count: Option(Int),
    redirect_uris: Option(List(String)),
    interaction_endpoint_url: Option(String),
    role_connections_verification_url: Option(String),
    tags: List(String),
    install_params: Option(InstallParams),
    integration_types_config: Option(
      Dict(ApplicationIntegrationType, ApplicationIntegrationTypeConfiguration),
    ),
    custom_install_url: Option(String),
  )
}
