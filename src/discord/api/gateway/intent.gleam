import gleam/int
import gleam/list

// GUILDS (1 << 0)
pub const guild_shift = 0

// GUILD_MEMBERS (1 << 1)
pub const guild_members_shift = 1

// GUILD_MODERATION (1 << 2)
pub const guild_moderation_shift = 2

// GUILD_EMOJIS_AND_STICKERS (1 << 3)
pub const guild_emojis_and_stickers_shift = 3

// GUILD_INTEGRATIONS (1 << 4)
pub const guild_integrations_shift = 4

// GUILD_WEBHOOKS (1 << 5)
pub const guild_webhooks_shift = 5

// GUILD_INVITES (1 << 6) 
pub const guild_invites_shift = 6

// GUILD_VOICE_STATES (1 << 7)
pub const guild_voice_states_shift = 7

// GUILD_PRESENCES (1 << 8)
pub const guild_presences_shift = 8

// GUILD_MESSAGES (1 << 9)
pub const guild_messages_shift = 9

// GUILD_MESSAGE_REACTIONS (1 << 10)
pub const guild_message_reactions_shift = 10

// GUILD_MESSAGE_TYPING (1 << 11)
pub const guild_message_typing_shift = 11

// DIRECT_MESSAGES (1 << 12)
pub const direct_messages_shift = 12

// DIRECT_MESSAGE_REACTIONS (1 << 13)
pub const direct_message_reactions_shift = 13

// DIRECT_MESSAGE_TYPING (1 << 14)
pub const direct_message_typing_shift = 14

// MESSAGE_CONTENT (1 << 15)
pub const message_content_shift = 15

// GUILD_SCHEDULED_EVENTS (1 << 16)
pub const guild_scheduled_events_shift = 16

// AUTO_MODERATION_CONFIGURATION (1 << 20)
pub const auto_moderation_configuration_shift = 20

// AUTO_MODERATION_EXECUTION (1 << 21)
pub const auto_moderation_execution_shift = 21

// GUILD_MESSAGE_POLLS (1 << 24)
pub const guild_message_polls_shift = 24

// DIRECT_MESSAGE_POLLS (1 << 25)
pub const direct_message_polls_shift = 25

pub type Intent {
  Guild
  GuildMembers
  GuildModeration
  GuildEmojisAndStickers
  GuildIntegrations
  GuildWebhooks
  GuildInvites
  GuildVoiceStates
  GuildPresences
  GuildMessages
  GuildMessageReactions
  GuildMessageTyping
  DirectMessages
  DirectMessageReactions
  DirectMessageTyping
  MessageContent
  GuildScheduledEvents
  AutoModerationConfiguration
  AutoModerationExecution
  GuildMessagePolls
  DirectMessagePolls
}

pub fn to_int(intents: List(Intent)) -> Int {
  {
    use flag <- fn(a) { list.unique(intents) |> list.map(a) }

    let shift = case flag {
      Guild -> guild_shift
      GuildMembers -> guild_members_shift
      GuildModeration -> guild_moderation_shift
      GuildEmojisAndStickers -> guild_emojis_and_stickers_shift
      GuildIntegrations -> guild_integrations_shift
      GuildWebhooks -> guild_webhooks_shift
      GuildInvites -> guild_invites_shift
      GuildVoiceStates -> guild_voice_states_shift
      GuildPresences -> guild_presences_shift
      GuildMessages -> guild_messages_shift
      GuildMessageReactions -> guild_message_reactions_shift
      GuildMessageTyping -> guild_message_typing_shift
      DirectMessages -> direct_messages_shift
      DirectMessageReactions -> direct_message_reactions_shift
      DirectMessageTyping -> direct_message_typing_shift
      MessageContent -> message_content_shift
      GuildScheduledEvents -> guild_scheduled_events_shift
      AutoModerationConfiguration -> auto_moderation_configuration_shift
      AutoModerationExecution -> auto_moderation_execution_shift
      GuildMessagePolls -> guild_message_polls_shift
      DirectMessagePolls -> direct_message_polls_shift
    }

    int.bitwise_shift_left(1, shift)
  }
  |> list.fold(0, fn(a, b) { a + b })
}
