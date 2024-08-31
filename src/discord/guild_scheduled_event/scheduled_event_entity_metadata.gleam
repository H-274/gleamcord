import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-entity-metadata
pub type ScheduledEventEntityMetadata {
  ScheduledEventEntityMetadata(location: Option(String))
}
