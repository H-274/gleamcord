import discord/activity.{type Activity}
import discord/client_status.{type ClientStatus}
import discord/snowflake.{type Snowflake}
import discord/user.{type User}

pub type PresenceUpdate {
  PresenceUpdate(
    user: User,
    guild_id: Snowflake,
    status: String,
    activities: List(Activity),
    client_status: ClientStatus,
  )
}
