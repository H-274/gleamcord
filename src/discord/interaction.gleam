import decode.{type Decoder}
import discord/channel.{type Channel}
import discord/command.{type CommandOption, type ResolvedData}
import discord/common.{type Snowflake}
import discord/guild.{type Guild, type Member}
import discord/message.{type Message}
import discord/user.{type User}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

pub type InteractionRequest {
  InteractionRequest(
    id: Snowflake,
    application_id: Snowflake,
    i_type: InteractionType,
    data: Option(InteractionData),
    guild: Option(Guild),
    guild_id: Option(Snowflake),
    channel: Option(Channel),
    channel_id: Option(Snowflake),
    member: Option(Member),
    user: Option(User),
    token: String,
    version: Int,
    message: Option(Message),
    app_permissions: String,
    locale: Option(String),
    guild_locale: Option(String),
    entitlements: List(Entitlement),
    authorizing_integration_owners: Dict(IntegrationType, Int),
    context: InteractionContext,
  )
}

pub fn base_interaction_decoder() -> Decoder(InteractionRequest) {
  decode.into({
    use id <- decode.parameter
    use application_id <- decode.parameter
    use i_type <- decode.parameter
    use data <- decode.parameter
    use guild <- decode.parameter
    use guild_id <- decode.parameter
    use channel <- decode.parameter
    use channel_id <- decode.parameter
    use member <- decode.parameter
    use user <- decode.parameter
    use token <- decode.parameter
    use version <- decode.parameter
    use message <- decode.parameter
    use app_permissions <- decode.parameter
    use locale <- decode.parameter
    use guild_locale <- decode.parameter
    use entitlements <- decode.parameter
    use authorizing_integration_owners <- decode.parameter
    use context <- decode.parameter

    InteractionRequest(
      id,
      application_id,
      i_type,
      data,
      guild,
      guild_id,
      channel,
      channel_id,
      member,
      user,
      token,
      version,
      message,
      app_permissions,
      locale,
      guild_locale,
      entitlements,
      authorizing_integration_owners,
      context,
    )
  })
  |> decode.field("id", decode.int)
  |> decode.field("application_id", decode.int)
  |> decode.field("type", interaction_type_decoder())
  |> decode.field("data", decode.optional(interaction_data_decoder()))
  |> decode.field("guild", decode.optional(guild.guild_decoder()))
  |> decode.field("guild_id", decode.optional(decode.int))
  |> decode.field("channel", decode.optional(channel.channel_decoder()))
  |> decode.field("channel_id", decode.optional(decode.int))
  |> decode.field("member", decode.optional(guild.member_decoder()))
  |> decode.field("user", decode.optional(user.user_decoder()))
  |> decode.field("token", decode.string)
  |> decode.field("version", decode.int)
  |> decode.field("message", decode.optional(message.message_decoder()))
  |> decode.field("app_permissions", decode.string)
  |> decode.field("locale", decode.optional(decode.string))
  |> decode.field("guild_locale", decode.optional(decode.string))
  |> decode.field("entitlements", decode.list(of: entitlement_decoder()))
  |> decode.field(
    "authorizing_integration_owners",
    decode.dict(integration_type_decoder(), decode.int),
  )
  |> decode.field("context", interaction_context_decoder())
}

pub type InteractionType {
  Ping
  ApplicationCommand
  MessageComponent
  ApplicationCommandAutocomplete
  ModalSubmit
}

pub fn interaction_type_decoder() -> Decoder(InteractionType) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "1" -> decode.into(Ping)
      "2" -> decode.into(ApplicationCommand)
      "3" -> decode.into(MessageComponent)
      "4" -> decode.into(ApplicationCommandAutocomplete)
      "5" -> decode.into(ModalSubmit)
      // ---
      _ -> decode.fail("InteractionType")
    }
  })
}

pub type IntegrationType {
  GuildInstall
  UserInstall
}

pub fn integration_type_decoder() -> Decoder(IntegrationType) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "0" -> decode.into(GuildInstall)
      "1" -> decode.into(UserInstall)
      // ---
      _ -> decode.fail("IntegrationType")
    }
  })
}

pub type InteractionData {
  InteractionData(
    id: Snowflake,
    name: String,
    command_type: Int,
    resolved: Option(ResolvedData),
    options: Option(List(CommandOption)),
    guild_id: Option(Snowflake),
    target_id: Option(Snowflake),
  )
}

pub fn interaction_data_decoder() -> Decoder(InteractionData) {
  decode.into({
    use id <- decode.parameter
    use name <- decode.parameter
    use command_type <- decode.parameter
    use resolved <- decode.parameter
    use options <- decode.parameter
    use guild_id <- decode.parameter
    use target_id <- decode.parameter

    InteractionData(
      id,
      name,
      command_type,
      resolved,
      options,
      guild_id,
      target_id,
    )
  })
  |> decode.field("id", decode.int)
  |> decode.field("name", decode.string)
  |> decode.field("type", decode.int)
  |> decode.field("resolved", decode.optional(command.resolved_data_decoder()))
  |> decode.field(
    "options",
    decode.optional(decode.list(command.command_option_decoder())),
  )
  |> decode.field("guild_id", decode.optional(decode.int))
  |> decode.field("target_id", decode.optional(decode.int))
}

pub type InteractionContext {
  GuildContext
  BotDMContext
  PrivateChannelContext
}

pub fn interaction_context_decoder() -> Decoder(InteractionContext) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "0" -> decode.into(GuildContext)
      "1" -> decode.into(BotDMContext)
      "2" -> decode.into(PrivateChannelContext)
      // ---
      _ -> decode.fail("InteractionContext")
    }
  })
}

// TODO

pub type Entitlement {
  Entitlement
}

pub fn entitlement_decoder() -> Decoder(Entitlement) {
  decode.into(Entitlement)
}
