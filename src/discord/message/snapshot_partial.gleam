import birl.{type Time}
import discord/message/attachement.{type Attachment}
import discord/message/embed.{type Embed}
import discord/message/message_flag.{type MessageFlag}
import discord/message/message_type.{type MessageType}
import discord/permissions/role.{type Role}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-snapshot-structure
pub type SnapshotPartial {
  SnapshotPartial(
    typ: MessageType,
    content: String,
    embeds: List(Embed),
    attachments: List(Attachment),
    timestamp: Time,
    edited_timestamp: Time,
    flags: Option(List(MessageFlag)),
    mentions: List(User),
    mention_roles: List(Role),
  )
}
