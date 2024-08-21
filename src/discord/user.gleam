import discord/avatar_decoration_data.{type AvatarDecorationData}
import discord/snowflake.{type Snowflake}
import gleam/option.{type Option}

pub type User {
  User(
    id: Snowflake,
    username: String,
    discriminator: String,
    global_name: Option(String),
    avatar: Option(String),
    bot: Option(Bool),
    system: Option(Bool),
    mfa_enabled: Option(Bool),
    banner: Option(String),
    accent_color: Option(Int),
    locale: Option(String),
    verified: Option(Bool),
    email: Option(String),
    flags: Option(Int),
    premium_type: Option(Int),
    public_flags: Option(Int),
    avatar_decoration_data: Option(AvatarDecorationData),
  )
}
