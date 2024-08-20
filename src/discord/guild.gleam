import birl.{type Time}
import decode.{type Decoder}
import discord/common.{type Snowflake}
import discord/user.{type AvatarDecoration, type User}
import discord/utils/time
import gleam/option.{type Option}

// TODO

pub type Guild {
  Guild
}

pub fn guild_decoder() -> Decoder(Guild) {
  decode.into(Guild)
}

pub type Member {
  Member(
    user: User,
    nick: Option(String),
    avatar: Option(String),
    roles: List(Snowflake),
    joined_at: Time,
    premium_since: Option(Time),
    deaf: Bool,
    mute: Bool,
    flags: Int,
    pending: Bool,
    permissions: String,
    communication_disabled_until: Option(Time),
    avatar_decoration: Option(AvatarDecoration),
  )
}

pub fn member_decoder() -> Decoder(Member) {
  decode.into({
    use user <- decode.parameter
    use nick <- decode.parameter
    use avatar <- decode.parameter
    use roles <- decode.parameter
    use joined_at <- decode.parameter
    use premium_since <- decode.parameter
    use deaf <- decode.parameter
    use mute <- decode.parameter
    use flags <- decode.parameter
    use pending <- decode.parameter
    use permissions <- decode.parameter
    use communication_disabled_until <- decode.parameter
    use avatar_decoration <- decode.parameter

    Member(
      user,
      nick,
      avatar,
      roles,
      joined_at,
      premium_since,
      deaf,
      mute,
      flags,
      pending,
      permissions,
      communication_disabled_until,
      avatar_decoration,
    )
  })
  |> decode.field("user", user.user_decoder())
  |> decode.field("nick", decode.optional(decode.string))
  |> decode.field("avatar", decode.optional(decode.string))
  |> decode.field("roles", decode.list(decode.int))
  |> decode.field("joined_at", time.iso8601_string_decoder())
  |> decode.field(
    "premium_since",
    decode.optional(time.iso8601_string_decoder()),
  )
  |> decode.field("deaf", decode.bool)
  |> decode.field("mute", decode.bool)
  |> decode.field("flags", decode.int)
  |> decode.field("pending", decode.bool)
  |> decode.field("permissions", decode.string)
  |> decode.field(
    "communication_disabled_until",
    decode.optional(time.iso8601_string_decoder()),
  )
  |> decode.field(
    "avatar_decoration",
    decode.optional(user.avatar_decoration_decoder()),
  )
}
