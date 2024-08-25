import birl.{type Time}
import discord/channel_flag.{type ChannelFlag}
import discord/channel_type.{type ChannelType}
import discord/default_reaction_emoji.{type DefaultReactionEmoji}
import discord/forum_tag.{type ForumTag}
import discord/overwrite.{type Overwrite}
import discord/snowflake.{type Snowflake}
import discord/thread_member.{type ThreadMember}
import discord/thread_metadata.{type ThreadMetadata}
import discord/user.{type User}
import gleam/option.{type Option}

pub type Channel {
  Channel(
    id: Snowflake,
    c_type: ChannelType,
    guild_id: Option(Snowflake),
    position: Option(Int),
    permission_overwrites: List(Overwrite),
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
    member_count: Option(Int),
    thread_metadata: Option(ThreadMetadata),
    member: Option(ThreadMember),
    default_auto_archive_duration: Option(Int),
    permissions: Option(String),
    flags: Option(List(ChannelFlag)),
    total_message_sent: Option(Int),
    available_tags: Option(List(ForumTag)),
    applied_tags: Option(Snowflake),
    default_reaction_emoji: Option(DefaultReactionEmoji),
    default_thread_rate_limit_per_user: Option(Int),
    default_sort_order: Option(Int),
    default_forum_layout: Option(Int),
  )
}
