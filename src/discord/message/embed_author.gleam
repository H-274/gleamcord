import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-author-structure
pub type EmbedAuthor {
  EmbedAuthor(
    name: String,
    url: Option(String),
    icon_url: Option(String),
    proxy_icon_url: Option(String),
  )
}
