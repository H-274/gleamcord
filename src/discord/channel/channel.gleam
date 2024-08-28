import birl.{type Time}
import discord/channel/channel_flag.{type ChannelFlag}
import discord/channel/channel_type.{type ChannelType}
import discord/channel/default_reaction.{type DefaultReaction}
import discord/channel/forum_layout.{type ForumLayout}
import discord/channel/forum_sort_order.{type ForumSortOrder}
import discord/channel/forum_tag.{type ForumTag}
import discord/channel/overwrite.{type Overwrite}
import discord/channel/thread_member.{type ThreadMember}
import discord/channel/thread_metadata.{type ThreadMetadata}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/channel#channel-object-channel-structure
pub type Channel {
  Channel(
    id: Snowflake,
    typ: ChannelType,
    guild_id: Option(Snowflake),
    position: Option(Int),
    permission_overwrites: Option(List(Overwrite)),
    name: Option(String),
    topic: Option(String),
    nsfw: Option(Bool),
    last_message_id: Option(Snowflake),
    bitrate: Option(Int),
    user_limit: Option(Int),
    rate_limit_per_user: Option(Int),
    recipients: Option(List(User)),
    icon: Option(String),
    owner_id: Option(Snowflake),
    application_id: Option(Snowflake),
    managed: Option(Bool),
    parent_id: Option(Snowflake),
    last_pin_timestamp: Option(Time),
    rtc_region: Option(String),
    video_quality_mode: Option(Int),
    message_count: Option(Int),
    thread_metadata: Option(ThreadMetadata),
    member: Option(ThreadMember),
    default_auto_archive_duration: Option(Int),
    permissions: Option(String),
    flags: Option(List(ChannelFlag)),
    total_message_sent: Option(Int),
    available_tags: Option(List(ForumTag)),
    applied_tags: Option(List(Snowflake)),
    default_reaction_emoji: Option(DefaultReaction),
    default_thread_rate_limit_per_user: Option(Int),
    default_sort_order: Option(ForumSortOrder),
    default_forum_layout: Option(ForumLayout),
  )
}
