import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-image-structure
pub type EmbedImage {
  EmbedImage(
    url: String,
    proxy_url: Option(String),
    height: Option(Int),
    width: Option(Int),
  )
}
