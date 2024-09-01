import discord/message/snapshot_partial.{type SnapshotPartial}

/// https://discord.com/developers/docs/resources/message#message-snapshot-structure
pub type MessageSnapshot {
  MessageSnapshot(message: SnapshotPartial)
}
