import gleam/int
import gleam/list

pub const application_auto_moderation_rule_create_badge = #(
  ApplicationAutoModerationRuleCreateBadge,
  0b1000000,
)

pub const gateway_presence = #(GatewayPresence, 0b1000000000000)

pub const gateway_presence_limited = #(GatewayPresenceLimited, 0b10000000000000)

pub const gateway_guild_members = #(GatewayGuildMembers, 0b100000000000000)

pub const gateway_guild_members_limited = #(
  GatewayGuildMembersLimited,
  0b1000000000000000,
)

pub const verification_pending_guild_limit = #(
  VerificationPendingGuildLimit,
  0b10000000000000000,
)

pub const embedded = #(Embedded, 0b100000000000000000)

pub const gateway_message_content = #(
  GatewayMessageContent,
  0b1000000000000000000,
)

pub const gateway_message_content_limited = #(
  GatewayMessageContentLimited,
  0b10000000000000000000,
)

pub const application_command_badge = #(
  ApplicationCommandBadge,
  0b100000000000000000000000,
)

pub const flag_tuple_list = [
  application_auto_moderation_rule_create_badge, gateway_presence,
  gateway_presence_limited, gateway_guild_members, gateway_guild_members_limited,
  verification_pending_guild_limit, embedded, gateway_message_content,
  gateway_message_content_limited, application_command_badge,
]

/// https://discord.com/developers/docs/resources/application#application-object-application-flags
pub type ApplicationFlag {
  // 1 << 6
  ApplicationAutoModerationRuleCreateBadge
  // 1 << 12
  GatewayPresence
  // 1 << 13
  GatewayPresenceLimited
  // 1 << 14
  GatewayGuildMembers
  // 1 << 15
  GatewayGuildMembersLimited
  // 1 << 16
  VerificationPendingGuildLimit
  // 1 << 17
  Embedded
  // 1 << 18
  GatewayMessageContent
  // 1 << 19
  GatewayMessageContentLimited
  // 1 << 23
  ApplicationCommandBadge
}

pub fn from_int(val: Int) -> List(ApplicationFlag) {
  use flag_tuple <- list.filter_map(flag_tuple_list)

  case int.bitwise_and(flag_tuple.1, val) != 0 {
    True -> Ok(flag_tuple.0)
    False -> Error(Nil)
  }
}

pub fn to_int(flags: List(ApplicationFlag)) -> Int {
  {
    use intent <- list.map(flags)

    case intent {
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
  }
  |> list.fold(0, fn(a, b) { a + b })
}
