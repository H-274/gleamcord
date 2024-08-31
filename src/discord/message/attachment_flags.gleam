import gleam/int
import gleam/list

// (1 << 2)
pub const is_remix = #(IsRemix, 2)

pub const flag_tuple_list: List(#(AttachmentFlag, Int)) = [is_remix]

/// https://discord.com/developers/docs/resources/message#attachment-object-attachment-flags
pub type AttachmentFlag {
  IsRemix
}

pub fn from_int(val: Int) -> List(AttachmentFlag) {
  use flag_tuple <- list.filter_map(flag_tuple_list)
  let flag_val = int.bitwise_shift_left(1, flag_tuple.1)

  case int.bitwise_and(flag_val, val) != 0 {
    True -> Ok(flag_tuple.0)
    False -> Error(Nil)
  }
}

pub fn to_int(flags: List(AttachmentFlag)) -> Int {
  use acc, flag <- list.fold(flags, 0)

  let flag_shift = case flag {
    IsRemix -> is_remix.1
  }

  acc + int.bitwise_shift_left(1, flag_shift)
}
