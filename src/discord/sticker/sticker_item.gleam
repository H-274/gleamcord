import discord/snowflake.{type Snowflake}
import discord/sticker/sticker_format_type.{type StickerFormatType}

/// https://discord.com/developers/docs/resources/sticker#sticker-item-object
pub type StickerItem {
  StickerItem(id: Snowflake, name: String, format_type: StickerFormatType)
}
