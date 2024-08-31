import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-footer-structure
pub type EmbedFooter {
  EmbedFooter(
    text: String,
    icon_url: Option(String),
    proxy_icon_url: Option(String),
  )
}
