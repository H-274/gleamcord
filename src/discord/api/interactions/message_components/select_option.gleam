import discord/emoji/emoji.{type Emoji}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/interactions/message-components#select-menu-object-select-option-structure
pub type SelectOption {
  SelectOption(
    label: String,
    value: String,
    description: Option(String),
    emoji: Option(Emoji),
    default: Option(Bool),
  )
}
