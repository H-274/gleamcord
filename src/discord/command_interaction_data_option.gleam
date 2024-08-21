import gleam/dynamic.{type Dynamic}
import gleam/option.{type Option}

pub type CommandInteractionDataOption {
  CommandInteractionDataOption(
    name: String,
    o_type: Int,
    value: Option(Dynamic),
    options: List(CommandInteractionDataOption),
    focused: Option(Bool),
  )
}
