import discord/guild.{type Guild}
import discord/user.{type User}
import gleam/option.{type Option}

pub type ReadyData {
  ReadyData(
    v: Int,
    user: User,
    guilds: List(Guild),
    session_id: String,
    resume_gateway_url: String,
    shard: Option(List(Int)),
  )
}
