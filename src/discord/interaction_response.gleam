import discord/interaction_callback_data.{type InteractionCallbackData}
import discord/interaction_callback_type.{type InteractionCallbackType}
import gleam/option.{type Option}

pub type InteractionResponse {
  InteractionResponse(
    callback_type: InteractionCallbackType,
    data: Option(InteractionCallbackData),
  )
}
