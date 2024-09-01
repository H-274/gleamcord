import discord/api/interactions/interaction_type.{type InteractionType}
import discord/guild/guild_member.{type GuildMember}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/interactions/receiving-and-responding#message-interaction-object-message-interaction-structure
pub type MessageInteraction {
  MessageInteraction(
    id: Snowflake,
    typ: InteractionType,
    name: String,
    user: User,
    member: Option(GuildMember),
  )
}
