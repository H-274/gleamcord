import decode.{type Decoder}
import gleam/dynamic.{type Dynamic}
import gleam/option.{type Option}

pub type CommandOption {
  CommandOption(
    name: String,
    o_type: Int,
    value: Option(Dynamic),
    options: Option(List(CommandOption)),
    focused: Option(Bool),
  )
}

pub fn command_option_decoder() -> Decoder(CommandOption) {
  decode.into({
    use name <- decode.parameter
    use o_type <- decode.parameter
    use value <- decode.parameter
    use options <- decode.parameter
    use focused <- decode.parameter

    CommandOption(name, o_type, value, options, focused)
  })
  |> decode.field("name", decode.string)
  |> decode.field("type", decode.int)
  |> decode.field("value", decode.optional(decode.dynamic))
  |> decode.field(
    "options",
    decode.optional(decode.list(
      decode.dynamic |> decode.then(fn(_) { command_option_decoder() }),
    )),
  )
  |> decode.field("focused", decode.optional(decode.bool))
}

// TODO

pub type ResolvedData {
  ResolvedData
}

pub fn resolved_data_decoder() -> Decoder(ResolvedData) {
  decode.into(ResolvedData)
}
