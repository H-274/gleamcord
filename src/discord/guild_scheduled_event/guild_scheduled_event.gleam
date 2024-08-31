import birl.{type Time}
import discord/guild_scheduled_event/event_status.{type EventStatus}
import discord/guild_scheduled_event/privacy_level.{type PrivacyLevel}
import discord/guild_scheduled_event/recurrence_rule.{type RecurrenceRule}
import discord/guild_scheduled_event/scheduled_entity_type.{
  type ScheduledEntityTypes,
}
import discord/guild_scheduled_event/scheduled_event_entity_metadata.{
  type ScheduledEventEntityMetadata,
}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-structure
pub type GuildScheduledEvent {
  GuildScheduledEvent(
    id: Snowflake,
    guild_id: Snowflake,
    channel_id: Option(Snowflake),
    creator_id: Option(Snowflake),
    name: String,
    description: Option(String),
    scheduled_start_time: Time,
    scheduled_end_time: Option(Time),
    privacy_level: PrivacyLevel,
    status: EventStatus,
    entity_type: ScheduledEntityTypes,
    entity_id: Option(Snowflake),
    entity_metadata: Option(ScheduledEventEntityMetadata),
    creator: Option(User),
    user_count: Option(Int),
    image: Option(String),
    recurrence_rule: Option(RecurrenceRule),
  )
}
