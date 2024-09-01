import discord/message/message_reference_type.{type MessageReferenceType}
import discord/snowflake.{type Snowflake}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-reference-structure
pub type MessageReference {
  MessageReference(
    typ: Option(MessageReferenceType),
    message_id: Option(Snowflake),
    channel_id: Option(Snowflake),
    guild_id: Option(Snowflake),
    fail_if_not_exists: Option(Bool),
  )
}
