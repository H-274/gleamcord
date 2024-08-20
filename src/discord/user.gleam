import decode.{type Decoder}
import discord/common.{type Snowflake}

// TODO

pub type User {
  User
}

pub fn user_decoder() -> Decoder(User) {
  decode.into(User)
}

pub type AvatarDecoration {
  AvatarDecoration(asset: String, sku: Snowflake)
}

pub fn avatar_decoration_decoder() -> Decoder(AvatarDecoration) {
  decode.into({
    use asset <- decode.parameter
    use sku <- decode.parameter

    AvatarDecoration(asset, sku)
  })
  |> decode.field("asset", decode.string)
  |> decode.field("sku", decode.int)
}
