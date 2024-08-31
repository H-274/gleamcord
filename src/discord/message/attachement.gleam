import discord/message/attachment_flags.{type AttachmentFlag}
import discord/snowflake.{type Snowflake}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#attachment-object-attachment-structure
pub type Attachment {
  Attachment(
    id: Snowflake,
    filename: String,
    title: Option(String),
    description: Option(String),
    content_type: Option(String),
    size: Int,
    url: String,
    proxy_url: String,
    height: Option(Int),
    width: Option(Int),
    ephemeral: Option(Bool),
    duration_secs: Option(Float),
    waveform: Option(String),
    flags: Option(List(AttachmentFlag)),
  )
}
