import decode.{type Decoder}

// TODO

pub type Channel {
  Channel
}

pub fn channel_decoder() -> Decoder(Channel) {
  decode.into(Channel)
}

pub type ChannelType {
  GuildText
  DM
  GuildVoice
  GroupDM
  GuildCategory
  GuildAnnouncement
  AnnouncementThread
  PublicThread
  PrivateThread
  GuildStageVoice
  GuildDirectory
  GuildForum
  GuildMedia
}

pub fn channel_type_decoder() -> Decoder(ChannelType) {
  decode.string
  |> decode.then(fn(str) {
    case str {
      "0" -> decode.into(GuildText)
      "1" -> decode.into(DM)
      "2" -> decode.into(GuildVoice)
      "3" -> decode.into(GroupDM)
      "4" -> decode.into(GuildCategory)
      "5" -> decode.into(GuildAnnouncement)
      "10" -> decode.into(AnnouncementThread)
      "11" -> decode.into(PublicThread)
      "12" -> decode.into(PrivateThread)
      "13" -> decode.into(GuildStageVoice)
      "14" -> decode.into(GuildDirectory)
      "15" -> decode.into(GuildForum)
      "16" -> decode.into(GuildMedia)
      // ---
      _ -> decode.fail("ChannelType")
    }
  })
}
