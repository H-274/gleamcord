import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#embed-object-embed-field-structure
pub type EmbedField {
  EmbedField(name: String, value: String, inline: Option(Bool))
}
