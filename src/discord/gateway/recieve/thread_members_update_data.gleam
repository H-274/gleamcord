import discord/snowflake.{type Snowflake}
import discord/thread_member.{type ThreadMember}
import gleam/option.{type Option}

pub type ThreadMembersUpdateData {
  ThreadMembersUpdateData(
    id: Snowflake,
    guild_id: Snowflake,
    member_count: Int,
    added_members: Option(List(ThreadMember)),
    removed_member_ids: Option(List(Snowflake)),
  )
}
