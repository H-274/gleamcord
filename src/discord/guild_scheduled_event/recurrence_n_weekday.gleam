import discord/guild_scheduled_event/recurrence_weekday.{type RecurrenceWeekday}

/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-recurrence-rule-object-guild-scheduled-event-recurrence-rule-nweekday-structure
pub type RecurrenceNWeekday {
  RecurrenceNWeekday(n: Int, day: RecurrenceWeekday)
}
