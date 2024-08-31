import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-video-structure
pub type EmbedVideo {
  EmbedVideo(
    url: String,
    proxy_url: Option(String),
    height: Option(Int),
    width: Option(Int),
  )
}
