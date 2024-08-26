import gleam/list

// GUILDS (1 << 0)
pub const guild_val = 0b1

// GUILD_MEMBERS (1 << 1)
pub const guild_members_val = 0b10

// GUILD_MODERATION (1 << 2)
pub const guild_moderation_val = 0b100

// GUILD_EMOJIS_AND_STICKERS (1 << 3)
pub const guild_emojis_and_stickers_val = 0b1000

// GUILD_INTEGRATIONS (1 << 4)
pub const guild_integrations_val = 0b10000

// GUILD_WEBHOOKS (1 << 5)
pub const guild_webhooks_val = 0b100000

// GUILD_INVITES (1 << 6) 
pub const guild_invites_val = 0b1000000

// GUILD_VOICE_STATES (1 << 7)
pub const guild_voice_states_val = 0b10000000

// GUILD_PRESENCES (1 << 8)
pub const guild_presences_val = 0b100000000

// GUILD_MESSAGES (1 << 9)
pub const guild_messages_val = 0b1000000000

// GUILD_MESSAGE_REACTIONS (1 << 10)
pub const guild_message_reactions_val = 0b10000000000

// GUILD_MESSAGE_TYPING (1 << 11)
pub const guild_message_typing_val = 0b100000000000

// DIRECT_MESSAGES (1 << 12)
pub const direct_messages_val = 0b1000000000000

// DIRECT_MESSAGE_REACTIONS (1 << 13)
pub const direct_message_reactions_val = 0b10000000000000

// DIRECT_MESSAGE_TYPING (1 << 14)
pub const direct_message_typing_val = 0b100000000000000

// MESSAGE_CONTENT (1 << 15)
pub const message_content_val = 0b1000000000000000

// GUILD_SCHEDULED_EVENTS (1 << 16)
pub const guild_scheduled_events_val = 0b10000000000000000

// AUTO_MODERATION_CONFIGURATION (1 << 20)
pub const auto_moderation_configuration_val = 0b100000000000000000000

// AUTO_MODERATION_EXECUTION (1 << 21)
pub const auto_moderation_execution_val = 0b1000000000000000000000

// GUILD_MESSAGE_POLLS (1 << 24)
pub const guild_message_polls_val = 0b1000000000000000000000000

// DIRECT_MESSAGE_POLLS (1 << 25)
pub const direct_message_polls_val = 0b10000000000000000000000000

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

    case flag {
      Guild -> guild_val
      GuildMembers -> guild_members_val
      GuildModeration -> guild_moderation_val
      GuildEmojisAndStickers -> guild_emojis_and_stickers_val
      GuildIntegrations -> guild_integrations_val
      GuildWebhooks -> guild_webhooks_val
      GuildInvites -> guild_invites_val
      GuildVoiceStates -> guild_voice_states_val
      GuildPresences -> guild_presences_val
      GuildMessages -> guild_messages_val
      GuildMessageReactions -> guild_message_reactions_val
      GuildMessageTyping -> guild_message_typing_val
      DirectMessages -> direct_messages_val
      DirectMessageReactions -> direct_message_reactions_val
      DirectMessageTyping -> direct_message_typing_val
      MessageContent -> message_content_val
      GuildScheduledEvents -> guild_scheduled_events_val
      AutoModerationConfiguration -> auto_moderation_configuration_val
      AutoModerationExecution -> auto_moderation_execution_val
      GuildMessagePolls -> guild_message_polls_val
      DirectMessagePolls -> direct_message_polls_val
    }
  }
  |> list.fold(0, fn(a, b) { a + b })
}
