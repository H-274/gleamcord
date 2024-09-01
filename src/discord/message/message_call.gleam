import birl.{type Time}
import discord/snowflake.{type Snowflake}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-call-object
pub type MessageCall {
  MessageCall(participants: List(Snowflake), ended_timestamp: Option(Time))
}
