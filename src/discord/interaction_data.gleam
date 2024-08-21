import discord/command_interaction_data_option.{
  type CommandInteractionDataOption as CommandOption,
}
import discord/message_component.{type MessageComponent}
import discord/resolved_data.{type ResolvedData}
import discord/select_option.{type SelectOption}
import discord/snowflake.{type Snowflake}
import gleam/option.{type Option}

pub type InteractionData {
  CommandData(
    id: Snowflake,
    name: String,
    c_type: Int,
    resolved: Option(ResolvedData),
    options: Option(List(CommandOption)),
    guild_id: Option(Snowflake),
    target_id: Option(Snowflake),
  )
  MessageComponentData(
    custom_id: String,
    component_type: Int,
    values: Option(List(SelectOption)),
    resolved: Option(ResolvedData),
  )
  ModalSubmit(custom_id: String, components: List(MessageComponent))
}
