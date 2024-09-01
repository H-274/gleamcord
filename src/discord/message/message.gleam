import birl.{type Time}
import discord/api/interactions/message_components/message_component.{
  type MessageComponent,
}
import discord/api/interactions/message_interaction.{type MessageInteraction}
import discord/api/interactions/resolved/resolved_data.{type ResolvedData}
import discord/application/application.{type Application}
import discord/channel/channel.{type Channel}
import discord/message/attachement.{type Attachment}
import discord/message/channel_mention.{type ChannelMention}
import discord/message/embed.{type Embed}
import discord/message/interaction_metadata.{type InteractionMetadata}
import discord/message/message_activity.{type MessageActivity}
import discord/message/message_call.{type MessageCall}
import discord/message/message_flag.{type MessageFlag}
import discord/message/message_reference.{type MessageReference}
import discord/message/message_snapshot.{type MessageSnapshot}
import discord/message/message_type.{type MessageType}
import discord/message/reaction.{type Reaction}
import discord/message/role_subscription_data.{type RoleSubscriptionData}
import discord/permissions/role.{type Role}
import discord/poll/poll.{type Poll}
import discord/snowflake.{type Snowflake}
import discord/sticker/sticker.{type Sticker}
import discord/sticker/sticker_item.{type StickerItem}
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
    activity: Option(MessageActivity),
    application: Option(Application),
    application_id: Option(Snowflake),
    flags: Option(List(MessageFlag)),
    message_reference: Option(MessageReference),
    message_snapshots: Option(List(MessageSnapshot)),
    referenced_message: Option(Message),
    interaction_metadata: Option(InteractionMetadata),
    interaction: Option(MessageInteraction),
    thread: Option(Channel),
    components: Option(List(MessageComponent)),
    sticker_items: Option(List(StickerItem)),
    stickers: Option(List(Sticker)),
    position: Option(Int),
    role_subscription_data: Option(RoleSubscriptionData),
    resolved: Option(ResolvedData),
    poll: Option(Poll),
    call: Option(MessageCall),
  )
}
