import gleam/int
import gleam/iterator
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result

// 1 << 0
pub const staff_val = 0b1

// 1 << 1
pub const partner_val = 0b10

// 1 << 2
pub const hypesquad_val = 0b100

// 1 << 3
pub const bug_hunter_lvevel1_val = 0b1000

// 1 << 6
pub const hypesquad_online_house1_val = 0b1000000

// 1 << 7
pub const hypesquad_online_house2_val = 0b10000000

// 1 << 8
pub const hypesquad_online_house3_val = 0b100000000

// 1 << 9
pub const premium_early_supporter_val = 0b1000000000

// 1 << 10
pub const team_pseudo_user_val = 0b10000000000

// 1 << 14
pub const bug_hunter_level2_val = 0b100000000000000

// 1 << 16
pub const verified_bot_val = 0b10000000000000000

// 1 << 17
pub const verified_developer_val = 0b100000000000000000

// 1 << 18
pub const certified_moderator_val = 0b1000000000000000000

// 1 << 19
pub const bot_http_interactions_val = 0b10000000000000000000

// 1 << 22
pub const active_developer_val = 0b10000000000000000000000

pub type UserFlag {
  Staff
  Partner
  Hypesquad
  BugHunterLevel1
  HypesquadOnlineHouse1
  HypesquadOnlineHouse2
  HypesquadOnlineHouse3
  PremiumEarlySupporter
  TeamPseudoUser
  BugHunterLevel2
  VerifiedBot
  VerifiedDeveloper
  CertifiedModerator
  BotHttpInteractions
  ActiveDeveloper
}

pub fn from_int(val: Int) -> List(UserFlag) {
  let assert Ok(digits) = int.digits(val, 2)
  let digits_iter = list.reverse(digits) |> iterator.from_list

  let flags: List(Option(UserFlag)) = {
    use list, digit <- iterator.fold(over: digits_iter, from: [])
    let val = digit |> int.bitwise_shift_left(list.length(list))

    let flag = case val {
      _ if val == staff_val -> Some(Staff)
      _ if val == partner_val -> Some(Partner)
      _ if val == hypesquad_val -> Some(Hypesquad)
      _ if val == bug_hunter_lvevel1_val -> Some(BugHunterLevel1)
      _ if val == hypesquad_online_house1_val -> Some(HypesquadOnlineHouse1)
      _ if val == hypesquad_online_house2_val -> Some(HypesquadOnlineHouse2)
      _ if val == hypesquad_online_house3_val -> Some(HypesquadOnlineHouse3)
      _ if val == premium_early_supporter_val -> Some(PremiumEarlySupporter)
      _ if val == team_pseudo_user_val -> Some(TeamPseudoUser)
      _ if val == bug_hunter_level2_val -> Some(BugHunterLevel2)
      _ if val == verified_bot_val -> Some(VerifiedBot)
      _ if val == verified_developer_val -> Some(VerifiedDeveloper)
      _ if val == certified_moderator_val -> Some(CertifiedModerator)
      _ if val == bot_http_interactions_val -> Some(BotHttpInteractions)
      _ if val == active_developer_val -> Some(ActiveDeveloper)
      _ -> None
    }

    [flag, ..list]
  }

  flags
  |> option.values
}

pub fn to_int(flags: List(UserFlag)) -> Int {
  let mapped_flags = {
    use flag <- list.map(flags)

    case flag {
      Staff -> staff_val
      Partner -> partner_val
      Hypesquad -> hypesquad_val
      BugHunterLevel1 -> bug_hunter_lvevel1_val
      HypesquadOnlineHouse1 -> hypesquad_online_house1_val
      HypesquadOnlineHouse2 -> hypesquad_online_house2_val
      HypesquadOnlineHouse3 -> hypesquad_online_house3_val
      PremiumEarlySupporter -> premium_early_supporter_val
      TeamPseudoUser -> team_pseudo_user_val
      BugHunterLevel2 -> bug_hunter_level2_val
      VerifiedBot -> verified_bot_val
      VerifiedDeveloper -> verified_developer_val
      CertifiedModerator -> certified_moderator_val
      BotHttpInteractions -> bot_http_interactions_val
      ActiveDeveloper -> active_developer_val
    }
  }

  mapped_flags
  |> list.reduce(fn(a, b) { a + b })
  |> result.unwrap(0)
}
