import discord/avatar_decoration_data.{type AvatarDecorationData}
import discord/premium_type.{type PremiumType}
import discord/snowflake.{type Snowflake}
import discord/user_flag.{type UserFlag}
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
    flags: Option(List(UserFlag)),
    premium_type: Option(PremiumType),
    public_flags: Option(List(UserFlag)),
    avatar_decoration_data: Option(AvatarDecorationData),
  )
}
