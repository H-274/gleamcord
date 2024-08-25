import discord/gateway/send/identify_data.{type IndentifyData}
import discord/gateway/send/request_guild_members_data.{
  type RequestGuildMembersData,
}
import discord/gateway/send/resume_data.{type ResumeData}
import discord/gateway/send/update_presence_data.{type UpdatePresenceData}
import discord/gateway/send/update_voice_state.{type UpdateVoiceStateData}

/// https://discord.com/developers/docs/topics/gateway-events#send-events
pub type SendEvent {
  Identify(IndentifyData)
  Resume(ResumeData)
  Heartbeat(Int)
  RequestGuildMembers(RequestGuildMembersData)
  UpdateVoiceState(UpdateVoiceStateData)
  UpdatePresence(UpdatePresenceData)
}
