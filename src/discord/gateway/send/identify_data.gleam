import discord/gateway/intent.{type Intent}
import discord/gateway/send/update_presence_data.{type UpdatePresenceData}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#identify
pub opaque type IndentifyData {
  IndentifyData(
    token: String,
    properties: IdentifyConnectionProperties,
    compress: Option(Bool),
    large_threshold: Option(Int),
    shard: List(Int),
    presence: Option(UpdatePresenceData),
    intents: List(Intent),
  )
}

/// https://discord.com/developers/docs/topics/gateway-events#identify-identify-connection-properties
pub type IdentifyConnectionProperties {
  IdentifyConnectionProperties(os: String, browser: String, device: String)
}

pub fn new(
  token: String,
  properties: IdentifyConnectionProperties,
  shard: List(Int),
  intents: List(Intent),
) -> IndentifyData {
  IndentifyData(token, properties, None, None, shard, None, intents)
}

pub fn set_compress(data: IndentifyData, compress: Bool) {
  IndentifyData(..data, compress: Some(compress))
}

pub fn set_large_threshold(data: IndentifyData, large_threshold: Int) {
  IndentifyData(..data, large_threshold: Some(large_threshold))
}

pub fn set_presence(data: IndentifyData, presence: UpdatePresenceData) {
  IndentifyData(..data, presence: Some(presence))
}
