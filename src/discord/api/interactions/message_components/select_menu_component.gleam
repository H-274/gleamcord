import discord/api/interactions/message_components/message_component_type.{
  type MessageComponentType,
}
import discord/api/interactions/message_components/select_default_value.{
  type SelectDefaultValue,
}
import discord/api/interactions/message_components/select_option.{
  type SelectOption,
}
import discord/channel/channel_type.{type ChannelType}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/interactions/message-components#select-menu-object-select-menu-structure
pub type SelectMenuComponent {
  SelectMenuComponent(
    typ: MessageComponentType,
    custom_id: String,
    options: Option(List(SelectOption)),
    channel_types: Option(List(ChannelType)),
    placeholder: Option(String),
    default_values: Option(List(SelectDefaultValue)),
    min_values: Option(Int),
    max_values: Option(Int),
    disabled: Option(Bool),
  )
}
