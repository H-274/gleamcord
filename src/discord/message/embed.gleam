import birl.{type Time}
import discord/message/embed_author.{type EmbedAuthor}
import discord/message/embed_field.{type EmbedField}
import discord/message/embed_footer.{type EmbedFooter}
import discord/message/embed_image.{type EmbedImage}
import discord/message/embed_provider.{type EmbedProvider}
import discord/message/embed_thumbnail.{type EmbedThumbnail}
import discord/message/embed_type.{type EmbedType}
import discord/message/embed_video.{type EmbedVideo}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-structure
pub type Embed {
  Embed(
    title: Option(String),
    typ: Option(EmbedType),
    description: Option(String),
    url: Option(String),
    timestamp: Option(Time),
    color: Option(Int),
    footer: Option(EmbedFooter),
    image: Option(EmbedImage),
    thumbnail: Option(EmbedThumbnail),
    video: Option(EmbedVideo),
    provider: Option(EmbedProvider),
    author: Option(EmbedAuthor),
    fields: Option(List(EmbedField)),
  )
}
