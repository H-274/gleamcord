import birl.{type Time}
import discord/guild_scheduled_event/recurrence_frequency.{
  type RecurrenceFrequency,
}
import discord/guild_scheduled_event/recurrence_month.{type RecurrenceMonth}
import discord/guild_scheduled_event/recurrence_n_weekday.{
  type RecurrenceNWeekday,
}
import discord/guild_scheduled_event/recurrence_weekday.{type RecurrenceWeekday}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-recurrence-rule-object-guild-scheduled-event-recurrence-rule-structure
pub type RecurrenceRule {
  RecurrenceRule(
    start: Time,
    end: Option(Time),
    frequency: RecurrenceFrequency,
    interval: Int,
    by_weekday: Option(List(RecurrenceWeekday)),
    by_n_weekday: Option(List(RecurrenceNWeekday)),
    by_month: Option(List(RecurrenceMonth)),
    by_month_day: Option(List(Int)),
    by_year_day: Option(List(Int)),
    count: Option(Int),
  )
}
