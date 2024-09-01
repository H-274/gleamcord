import discord/message/message_activity_type.{type MessageActivityType}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-object-message-activity-structure
pub type MessageActivity {
  MessageActivity(typ: MessageActivityType, party_id: Option(String))
}
