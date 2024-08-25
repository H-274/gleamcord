import discord/channel.{type Channel}
import discord/snowflake.{type Snowflake}
import discord/thread_member.{type ThreadMember}
import gleam/option.{type Option}

pub type ThreadListSyncData {
  ThreadListSyncData(
    guild_id: Snowflake,
    channel_ids: Option(List(Snowflake)),
    threads: List(Channel),
    members: ThreadMember,
  )
}
