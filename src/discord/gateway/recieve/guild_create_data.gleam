import birl.{type Time}
import discord/channel.{type Channel}
import discord/gateway/recieve/presence_update.{type PresenceUpdate}
import discord/guild.{type Guild}
import discord/guild_scheduled_event.{type GuildScheduledEvent}
import discord/member.{type Member}
import discord/stage_instance.{type StageInstance}
import discord/voice_state.{type VoiceState}
import gleam/option.{type Option}

pub type GuildCreateData {
  GuildCreateData(
    Guild,
    joined_at: Time,
    large: Bool,
    unavailable: Option(Bool),
    member_count: Int,
    voice_states: List(VoiceState),
    members: List(Member),
    channels: List(Channel),
    threads: List(Channel),
    presences: List(PresenceUpdate),
    stage_instances: List(StageInstance),
    guild_scheduled_events: List(GuildScheduledEvent),
  )
}
