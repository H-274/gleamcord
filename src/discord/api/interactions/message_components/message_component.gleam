import discord/api/interactions/message_components/button_component.{
  type ButtonComponent,
}
import discord/api/interactions/message_components/message_component_type.{
  type MessageComponentType,
}
import discord/api/interactions/message_components/select_menu_component.{
  type SelectMenuComponent,
}
import discord/api/interactions/message_components/text_input_component.{
  type TextInputComponent,
}

/// https://discord.com/developers/docs/interactions/message-components
pub type MessageComponent {
  ActionRow(typ: MessageComponentType, List(MessageComponent))
  Button(ButtonComponent)
  TextInput(TextInputComponent)
  SelectMenu(SelectMenuComponent)
}
