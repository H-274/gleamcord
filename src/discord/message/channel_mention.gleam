import discord/channel/channel_type.{type ChannelType}
import discord/snowflake.{type Snowflake}

/// https://discord.com/developers/docs/resources/message#channel-mention-object-channel-mention-structure
pub type ChannelMention {
  ChannelMention(
    id: Snowflake,
    guild_id: Snowflake,
    typ: ChannelType,
    name: String,
  )
}
