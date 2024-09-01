import discord/api/interactions/resolved/resolved_channel.{type ResolvedChannel}
import discord/api/interactions/resolved/resolved_member.{type ResolvedMember}
import discord/api/interactions/resolved/resolved_message.{type ResolvedMessage}
import discord/message/attachement.{type Attachment}
import discord/permissions/role.{type Role}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-resolved-data-structure
pub type ResolvedData {
  ResolvedData(
    users: Option(Dict(Snowflake, User)),
    members: Option(Dict(Snowflake, ResolvedMember)),
    roles: Option(Dict(Snowflake, Role)),
    channels: Option(Dict(Snowflake, ResolvedChannel)),
    messages: Option(Dict(Snowflake, ResolvedMessage)),
    attachments: Option(Dict(Snowflake, Attachment)),
  )
}
