import gleam/int
import gleam/list

/// (1 << 0)
pub const crossposted = #(Crossposted, 0)

/// (1 << 1)
pub const is_crosspost = #(IsCrosspost, 1)

/// (1 << 2)
pub const suppress_embeds = #(SuppressEmbeds, 2)

/// (1 << 3)
pub const source_message_deleted = #(SourceMessageDeleted, 3)

/// (1 << 4)
pub const urgent = #(Urgent, 4)

/// (1 << 5)
pub const has_thread = #(HasThread, 5)

/// (1 << 6)
pub const ephemeral = #(Ephemeral, 6)

/// (1 << 7)
pub const loading = #(Loading, 7)

/// (1 << 8)
pub const failed_to_mention_some_roles_in_thread = #(
  FailedToMentionSomeRolesInThread,
  8,
)

/// (1 << 12)
pub const suppress_notifications = #(SuppressNotifications, 12)

/// (1 << 13)
pub const is_voice_message = #(IsVoiceMessage, 13)

pub const flag_tuple_list: List(#(MessageFlag, Int)) = [
  crossposted, is_crosspost, suppress_embeds, source_message_deleted, urgent,
  has_thread, ephemeral, loading, failed_to_mention_some_roles_in_thread,
  suppress_notifications, is_voice_message,
]

/// https://discord.com/developers/docs/resources/message#message-object-message-flags
pub type MessageFlag {
  Crossposted
  IsCrosspost
  SuppressEmbeds
  SourceMessageDeleted
  Urgent
  HasThread
  Ephemeral
  Loading
  FailedToMentionSomeRolesInThread
  SuppressNotifications
  IsVoiceMessage
}

pub fn from_int(val: Int) -> List(MessageFlag) {
  use flag_tuple <- list.filter_map(flag_tuple_list)
  let flag_val = int.bitwise_shift_left(1, flag_tuple.1)

  case int.bitwise_and(flag_val, val) != 0 {
    True -> Ok(flag_tuple.0)
    False -> Error(Nil)
  }
}

pub fn to_int(flags: List(MessageFlag)) -> Int {
  use acc, flag <- list.fold(flags, 0)

  let flag_shift = case flag {
    Crossposted -> crossposted.1
    IsCrosspost -> is_crosspost.1
    SuppressEmbeds -> suppress_embeds.1
    SourceMessageDeleted -> source_message_deleted.1
    Urgent -> urgent.1
    HasThread -> has_thread.1
    Ephemeral -> ephemeral.1
    Loading -> loading.1
    FailedToMentionSomeRolesInThread -> failed_to_mention_some_roles_in_thread.1
    SuppressNotifications -> suppress_notifications.1
    IsVoiceMessage -> is_voice_message.1
  }

  acc + int.bitwise_shift_left(1, flag_shift)
}
