import discord/command_permission_type.{type CommandPermissionType}
import discord/snowflake.{type Snowflake}

/// https://discord.com/developers/docs/interactions/application-commands#application-command-permissions-object-application-command-permissions-structure
pub type ApplicationCommandPermission {
  ApplicationCommandPermission(
    id: Snowflake,
    p_type: CommandPermissionType,
    permission: Bool,
  )
}
