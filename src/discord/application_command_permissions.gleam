import discord/application_command_permission.{type ApplicationCommandPermission}
import discord/snowflake.{type Snowflake}

/// https://discord.com/developers/docs/interactions/application-commands#application-command-permissions-object-guild-application-command-permissions-structure
pub type ApplicationCommandPermissions {
  ApplicationCommandPermissions(
    id: Snowflake,
    application_id: Snowflake,
    guild_id: Snowflake,
    permissions: List(ApplicationCommandPermission),
  )
}
