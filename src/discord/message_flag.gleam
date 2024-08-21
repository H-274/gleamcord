import gleam/int
import gleam/iterator
import gleam/list
import gleam/option.{type Option, None, Some}

// 1 << 0
pub const crossposted_val = 0b1

// 1 << 1
pub const is_crosspost_val = 0b10

// 1 << 2
pub const supress_embeds_val = 0b100

// 1 << 3
pub const source_message_deleted_val = 0b1000

// 1 << 4
pub const urgent_val = 0b10000

// 1 << 5
pub const has_thread_val = 0b100000

// 1 << 6
pub const ephemeral_val = 0b1000000

// 1 << 7
pub const loading_val = 0b10000000

// 1 << 8
pub const failed_to_mention_some_roles_in_thread_val = 0b100000000

// 1 << 12
pub const supress_notification_val = 0b1000000000000

// 1 << 13
pub const is_voice_message_val = 0b10000000000000

pub type MessageFlag {
  Crossposted
  IsCrosspost
  SupressEmbeds
  SourceMessageDeleted
  Urgent
  HasThread
  Ephemeral
  Loading
  FailedToMentionSomeRolesInThread
  SupressNotifications
  IsVoiceMessage
}

pub fn from_int(val: Int) -> List(MessageFlag) {
  let assert Ok(digits) = int.digits(val, 2)
  let digits_iter = list.reverse(digits) |> iterator.from_list

  let flags: List(Option(MessageFlag)) = {
    use list, digit <- iterator.fold(over: digits_iter, from: [])
    let val = digit |> int.bitwise_shift_left(list.length(list))

    let flag = case val {
      _ if val == crossposted_val -> Some(Crossposted)
      _ if val == is_crosspost_val -> Some(IsCrosspost)
      _ if val == supress_embeds_val -> Some(SupressEmbeds)
      _ if val == source_message_deleted_val -> Some(SourceMessageDeleted)
      _ if val == urgent_val -> Some(Urgent)
      _ if val == has_thread_val -> Some(HasThread)
      _ if val == ephemeral_val -> Some(Ephemeral)
      _ if val == loading_val -> Some(Loading)
      _ if val == failed_to_mention_some_roles_in_thread_val ->
        Some(FailedToMentionSomeRolesInThread)
      _ if val == supress_notification_val -> Some(SupressNotifications)
      _ if val == is_voice_message_val -> Some(IsVoiceMessage)
      // ---
      _ -> None
    }

    [flag, ..list]
  }

  flags
  |> option.values
}

pub fn to_int(flags: List(MessageFlag)) -> Int {
  let mapped_flags = {
    use flag <- list.map(flags)

    case flag {
      Crossposted -> crossposted_val
      IsCrosspost -> is_crosspost_val
      SupressEmbeds -> supress_embeds_val
      SourceMessageDeleted -> source_message_deleted_val
      Urgent -> urgent_val
      HasThread -> has_thread_val
      Ephemeral -> ephemeral_val
      Loading -> loading_val
      FailedToMentionSomeRolesInThread ->
        failed_to_mention_some_roles_in_thread_val
      SupressNotifications -> supress_notification_val
      IsVoiceMessage -> is_voice_message_val
    }
  }

  mapped_flags
  |> list.fold(0, fn(a, b) { a + b })
}
