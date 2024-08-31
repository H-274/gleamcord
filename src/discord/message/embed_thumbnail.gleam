import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-thumbnail-structure
pub type EmbedThumbnail {
  EmbedThumbnail(
    url: String,
    proxy_url: Option(String),
    height: Option(Int),
    width: Option(Int),
  )
}
