import discord/api/interactions/message_components/message_component_type.{
  type MessageComponentType,
}
import discord/api/interactions/message_components/text_input_style.{
  type TextInputStyle,
}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/interactions/message-components#text-input-object-text-input-structure
pub type TextInputComponent {
  TextInputComponent(
    typ: MessageComponentType,
    custom_id: String,
    style: TextInputStyle,
    label: String,
    min_length: Option(String),
    max_length: Option(String),
    required: Option(Bool),
    value: Option(String),
    placeholder: Option(String),
  )
}
