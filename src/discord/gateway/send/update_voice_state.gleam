import discord/snowflake.{type Snowflake}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#update-voice-state
pub opaque type UpdateVoiceStateData {
  UpdateVoiceStateData(
    guild_id: Snowflake,
    channel_id: Option(Snowflake),
    self_mute: Bool,
    self_deaf: Bool,
  )
}

pub fn new(guild_id: Snowflake, self_mute: Bool, self_deaf: Bool) {
  UpdateVoiceStateData(guild_id, None, self_mute, self_deaf)
}

pub fn set_channel_id(data: UpdateVoiceStateData, channel_id: Snowflake) {
  UpdateVoiceStateData(..data, channel_id: Some(channel_id))
}
