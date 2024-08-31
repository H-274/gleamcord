import birl.{type Time}
import discord/message/attachement.{type Attachment}
import discord/message/channel_mention.{type ChannelMention}
import discord/message/embed.{type Embed}
import discord/message/message_type.{type MessageType}
import discord/message/reaction.{type Reaction}
import discord/permissions/role.{type Role}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-object-message-structure
pub type Message {
  Message(
    id: Snowflake,
    channel_id: Snowflake,
    author: User,
    content: String,
    timestamp: Time,
    edited_timestamp: Option(Time),
    tts: Bool,
    mention_everyone: Bool,
    mentions: List(User),
    mention_roles: List(Role),
    mention_channels: Option(List(ChannelMention)),
    attachments: List(Attachment),
    embeds: List(Embed),
    reactions: Option(List(Reaction)),
    nonce: Option(String),
    pinned: Bool,
    webhook_id: Option(Snowflake),
    typ: MessageType,
  )
}
