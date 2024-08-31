//// TODO complete data constants and conversion function

import gleam/option.{type Option, None, Some}

pub const default = 0

pub const recipiant_add = 1

pub const recipiant_remove = 2

pub const call = 3

/// https://discord.com/developers/docs/resources/message#message-object-message-types
pub type MessageType {
  Default
  RecipiantAdd
  RecipiantRemove
  Call
  ChannelNameChange
  ChannelIconChange
  ChannelPinnedMessage
  UserJoin
  GuildBoost
  GuildBoostTier1
  GuildBoostTier2
  GuildBoostTier3
  ChannelFollowAdd
  GuildDiscoveryDisqualified
  GuildDiscoveryRequalified
  GuildDiscoveryGracePeriodInitialWarning
  GuildDiscoveryGracePeriodFinalWarning
  ThreadCreated
  Reply
  ChatInputCommand
  ThreadStarterMessage
  GuildInviteReminder
  ContextMenuCommand
  AutoModerationAction
  RoleSubscriptionPurchase
  InteractionPremiumUpsell
  StageStart
  StageEnd
  StageSpeaker
  StageTopic
  GuildApplicationPremiumSubscription
  GuildIncidentAlertModeEnabled
  GuildIncidentAlertModeDisabled
  GuildIncidentReportRaid
  GuildIncidentReportFalseAlarm
  PurchaseNotification
  PollResult
}

pub fn from_int(val: Int) -> Option(MessageType) {
  case val {
    _ if val == default -> Some(Default)
    _ if val == recipiant_add -> Some(RecipiantAdd)
    _ if val == recipiant_remove -> Some(RecipiantRemove)
    _ if val == call -> Some(Call)
    _ -> None
  }
}
