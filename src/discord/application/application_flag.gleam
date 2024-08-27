import gleam/int
import gleam/list

// 1 << 6
pub const application_auto_moderation_rule_create_badge = #(
  ApplicationAutoModerationRuleCreateBadge,
  6,
)

// 1 << 12
pub const gateway_presence = #(GatewayPresence, 12)

// 1 << 13
pub const gateway_presence_limited = #(GatewayPresenceLimited, 13)

// 1 << 14
pub const gateway_guild_members = #(GatewayGuildMembers, 14)

// 1 << 15
pub const gateway_guild_members_limited = #(GatewayGuildMembersLimited, 15)

// 1 << 16
pub const verification_pending_guild_limit = #(
  VerificationPendingGuildLimit,
  16,
)

// 1 << 17
pub const embedded = #(Embedded, 17)

// 1 << 18
pub const gateway_message_content = #(GatewayMessageContent, 18)

// 1 << 19
pub const gateway_message_content_limited = #(GatewayMessageContentLimited, 19)

// 1 << 23
pub const application_command_badge = #(ApplicationCommandBadge, 23)

pub const flag_tuple_list = [
  application_auto_moderation_rule_create_badge, gateway_presence,
  gateway_presence_limited, gateway_guild_members, gateway_guild_members_limited,
  verification_pending_guild_limit, embedded, gateway_message_content,
  gateway_message_content_limited, application_command_badge,
]

/// https://discord.com/developers/docs/resources/application#application-object-application-flags
pub type ApplicationFlag {
  ApplicationAutoModerationRuleCreateBadge
  GatewayPresence
  GatewayPresenceLimited
  GatewayGuildMembers
  GatewayGuildMembersLimited
  VerificationPendingGuildLimit
  Embedded
  GatewayMessageContent
  GatewayMessageContentLimited
  ApplicationCommandBadge
}

pub fn from_int(val: Int) -> List(ApplicationFlag) {
  use flag_tuple <- list.filter_map(flag_tuple_list)
  let flag_val = int.bitwise_shift_left(1, flag_tuple.1)

  case int.bitwise_and(flag_val, val) != 0 {
    True -> Ok(flag_tuple.0)
    False -> Error(Nil)
  }
}

pub fn to_int(flags: List(ApplicationFlag)) -> Int {
  {
    use acc, intent <- list.fold(over: flags, from: 0)

    // Could simplify if we can eventually use dictionaries in constants?
    let intent_shift = case intent {
      ApplicationAutoModerationRuleCreateBadge ->
        application_auto_moderation_rule_create_badge.1
      GatewayPresence -> gateway_presence.1
      GatewayPresenceLimited -> gateway_presence_limited.1
      GatewayGuildMembers -> gateway_guild_members.1
      GatewayGuildMembersLimited -> gateway_guild_members_limited.1
      VerificationPendingGuildLimit -> verification_pending_guild_limit.1
      Embedded -> embedded.1
      GatewayMessageContent -> gateway_message_content.1
      GatewayMessageContentLimited -> gateway_message_content_limited.1
      ApplicationCommandBadge -> application_command_badge.1
    }

    acc + int.bitwise_shift_left(1, intent_shift)
  }
}
