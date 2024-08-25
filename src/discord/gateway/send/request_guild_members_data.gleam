import discord/snowflake.{type Snowflake}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#request-guild-members
pub opaque type RequestGuildMembersData {
  RequestGuildMembersData(
    guild_id: Snowflake,
    query: Option(String),
    limit: Int,
    presences: Option(Bool),
    user_ids: List(Snowflake),
    nonce: Option(String),
  )
}

pub fn new(guild_id: Snowflake, limit: Int, user_ids: List(Snowflake)) {
  RequestGuildMembersData(guild_id, None, limit, None, user_ids, None)
}

pub fn set_query(data: RequestGuildMembersData, query: String) {
  RequestGuildMembersData(..data, query: Some(query))
}

pub fn set_presences(data: RequestGuildMembersData, presences: Bool) {
  RequestGuildMembersData(..data, presences: Some(presences))
}

pub fn set_nonce(data: RequestGuildMembersData, nonce: String) {
  RequestGuildMembersData(..data, nonce: Some(nonce))
}
