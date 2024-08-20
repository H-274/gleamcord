import decode.{type Decoder}
import discord/channel.{type ChannelType}
import discord/common.{type Snowflake}
import discord/interaction.{type IntegrationType, type InteractionContext}
import discord/user.{type User}
import gleam/dict.{type Dict}
import gleam/dynamic.{type Dynamic}
import gleam/option.{type Option}

pub type ApplicationCommand {
  ApplicationCommand(
    id: Snowflake,
    c_type: Option(ApplicationCommandType),
    application_id: Snowflake,
    guild_id: Option(Snowflake),
    name: String,
    name_localizations: Option(Dict(String, String)),
    description: String,
    description_localizations: Option(Dict(String, String)),
    options: Option(List(ApplicationCommandOption)),
    default_member_permissions: Option(String),
    dm_permission: Option(Bool),
    default_permission: Option(Bool),
    nsfw: Option(Bool),
    integration_types: Option(List(IntegrationType)),
    contexts: Option(List(InteractionContext)),
    version: Snowflake,
  )
}

pub fn application_command_decoder() -> Decoder(ApplicationCommand) {
  decode.into({
    use id <- decode.parameter
    use c_type <- decode.parameter
    use application_id <- decode.parameter
    use guild_id <- decode.parameter
    use name <- decode.parameter
    use name_localizations <- decode.parameter
    use description <- decode.parameter
    use description_localizations <- decode.parameter
    use options <- decode.parameter
    use default_member_permissions <- decode.parameter
    use dm_permission <- decode.parameter
    use default_permission <- decode.parameter
    use nsfw <- decode.parameter
    use integration_types <- decode.parameter
    use contexts <- decode.parameter
    use version <- decode.parameter

    ApplicationCommand(
      id,
      c_type,
      application_id,
      guild_id,
      name,
      name_localizations,
      description,
      description_localizations,
      options,
      default_member_permissions,
      dm_permission,
      default_permission,
      nsfw,
      integration_types,
      contexts,
      version,
    )
  })
  |> decode.field("id", decode.int)
  |> decode.field("type", decode.optional(application_command_type_decoder()))
  |> decode.field("application_id", decode.int)
  |> decode.field("guild_id", decode.optional(decode.int))
  |> decode.field("name", decode.string)
  |> decode.field(
    "name_localizations",
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  |> decode.field("description", decode.string)
  |> decode.field(
    "description_localizations",
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  |> decode.field(
    "options",
    decode.optional(decode.list(application_command_options_decoder())),
  )
  |> decode.field("default_member_permissions", decode.optional(decode.string))
  |> decode.field("dm_permission", decode.optional(decode.bool))
  |> decode.field("default_permission", decode.optional(decode.bool))
  |> decode.field("nsfw", decode.optional(decode.bool))
  |> decode.field(
    "integration_types",
    decode.optional(decode.list(interaction.integration_type_decoder())),
  )
  |> decode.field(
    "contexts",
    decode.optional(decode.list(interaction.interaction_context_decoder())),
  )
  |> decode.field("version", decode.int)
}

pub type ApplicationCommandType {
  ChatInput
  UserCommand
  Message
}

pub fn application_command_type_decoder() -> Decoder(ApplicationCommandType) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "1" -> decode.into(ChatInput)
      "2" -> decode.into(UserCommand)
      "3" -> decode.into(Message)
      // ---
      _ -> decode.fail("ApplicationCommandType")
    }
  })
}

pub type ApplicationCommandOption {
  ApplicationCommandOption(
    c_type: ApplicationCommandOptionType,
    name: String,
    name_localizations: Option(Dict(String, String)),
    description: String,
    description_localizations: Option(Dict(String, String)),
    required: Option(Bool),
    choices: Option(List(ApplicationCommandOptionChoice)),
    options: Option(List(ApplicationCommandOption)),
    channel_types: Option(List(ChannelType)),
    min_value: Option(Float),
    max_value: Option(Float),
    min_length: Option(Int),
    max_length: Option(Int),
    autocomplete: Option(Bool),
  )
}

pub fn application_command_options_decoder() -> Decoder(
  ApplicationCommandOption,
) {
  decode.into({
    use c_type <- decode.parameter
    use name <- decode.parameter
    use name_localization <- decode.parameter
    use description <- decode.parameter
    use description_localization <- decode.parameter
    use required <- decode.parameter
    use choices <- decode.parameter
    use options <- decode.parameter
    use channel_types <- decode.parameter
    use min_value <- decode.parameter
    use max_value <- decode.parameter
    use min_length <- decode.parameter
    use max_length <- decode.parameter
    use autocomplete <- decode.parameter

    ApplicationCommandOption(
      c_type,
      name,
      name_localization,
      description,
      description_localization,
      required,
      choices,
      options,
      channel_types,
      min_value,
      max_value,
      min_length,
      max_length,
      autocomplete,
    )
  })
  |> decode.field("type", application_command_option_type_decoder())
  |> decode.field("name", decode.string)
  |> decode.field(
    "name_localization",
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  |> decode.field("description", decode.string)
  |> decode.field(
    "description_localization",
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  |> decode.field("required", decode.optional(decode.bool))
  |> decode.field(
    "choices",
    decode.optional(decode.list(application_command_option_choice_decoder())),
  )
  |> decode.field(
    "options",
    decode.optional(decode.list(application_command_options_decoder())),
  )
  |> decode.field(
    "channel_types",
    decode.optional(decode.list(channel.channel_type_decoder())),
  )
  |> decode.field("min_value", decode.optional(decode.float))
  |> decode.field("max_value", decode.optional(decode.float))
  |> decode.field("min_length", decode.optional(decode.int))
  |> decode.field("max_length", decode.optional(decode.int))
  |> decode.field("autocomplete", decode.optional(decode.bool))
}

pub type ApplicationCommandOptionType {
  SubCommand
  SubCommandGroup
  String
  Integer
  Boolean
  User
  Channel
  Role
  Mentionable
  Number
  Attachment
}

pub fn application_command_option_type_decoder() -> Decoder(
  ApplicationCommandOptionType,
) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "1" -> decode.into(SubCommand)
      "2" -> decode.into(SubCommandGroup)
      "3" -> decode.into(String)
      "4" -> decode.into(Integer)
      "5" -> decode.into(Boolean)
      "6" -> decode.into(User)
      "7" -> decode.into(Channel)
      "8" -> decode.into(Role)
      "9" -> decode.into(Mentionable)
      "10" -> decode.into(Number)
      "11" -> decode.into(Attachment)
      // ---
      _ -> decode.fail("ApplicationCommandOptionType")
    }
  })
}

pub type ApplicationCommandOptionChoice {
  ApplicationCommandOptionChoice(
    name: String,
    name_localizations: Option(Dict(String, String)),
    value: Dynamic,
  )
}

pub fn application_command_option_choice_decoder() -> Decoder(
  ApplicationCommandOptionChoice,
) {
  decode.into({
    use name <- decode.parameter
    use name_localizations <- decode.parameter
    use value <- decode.parameter

    ApplicationCommandOptionChoice(name, name_localizations, value)
  })
  |> decode.field("name", decode.string)
  |> decode.field(
    "name_localization",
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  |> decode.field("value", decode.dynamic)
}
