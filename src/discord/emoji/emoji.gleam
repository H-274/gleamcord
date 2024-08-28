import discord/permissions/role.{type Role}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/emoji#emoji-object-emoji-structure
pub type Emoji {
  Emoji(
    id: Option(Snowflake),
    name: Option(String),
    roles: Option(List(Role)),
    user: Option(User),
    require_colons: Option(Bool),
    managed: Option(Bool),
    animated: Option(Bool),
    available: Option(Bool),
  )
}
