import discord/activity.{type Activity}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#update-voice-state
pub opaque type UpdatePresenceData {
  UpdatePresenceData(
    since: Option(Int),
    activities: List(Activity),
    status: String,
    afk: Bool,
  )
}

pub fn new(activities: List(Activity), status: String, afk: Bool) {
  UpdatePresenceData(None, activities, status, afk)
}

pub fn set_since(data: UpdatePresenceData, since: Int) {
  UpdatePresenceData(..data, since: Some(since))
}
