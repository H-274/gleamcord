import discord/channel.{type Channel}
import discord/gateway/recieve/guild_create_data.{type GuildCreateData}
import discord/gateway/recieve/hello_data.{type HelloData}
import discord/gateway/recieve/ready_data.{type ReadyData}
import discord/gateway/recieve/thread_list_sync_data.{type ThreadListSyncData}
import discord/gateway/recieve/thread_members_update_data.{
  type ThreadMembersUpdateData,
}

// TODO: 
pub type RecieveEvent {
  Hello(HelloData)
  Ready(ReadyData)
  Resumed(Nil)
  Reconnect(Nil)
  InvalidSession(Bool)
  // --- Channel ---
  ChannelCreate(Channel)
  ChannelUpdate(Channel)
  ChannelDelete(Channel)
  ThreadUpdate(Channel)
  ThreadDelete(Channel)
  ThreadListSync(ThreadListSyncData)
  ThreadMembersUpdate(ThreadMembersUpdateData)
  // --- Guild ---
  GuildCreate(GuildCreateData)
}
