import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-provider-structure
pub type EmbedProvider {
  EmbedProvider(name: Option(String), url: Option(String))
}
