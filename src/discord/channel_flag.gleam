import gleam/int
import gleam/list

/// PINNED (1 << 1)
pub const pinned_tuple = #(Pinned, 0b10)

/// REQUIRE_TAG (1 << 4)
pub const require_tag_tuple = #(RequireTag, 0b10000)

/// HIDE_MEDIA_DOWNLOAD_OPTIONS (1 << 15)
pub const hide_media_download_options_tuple = #(
  HideMediaDownloadOptions,
  0b1000000000000000,
)

pub const flag_tuple_list: List(#(ChannelFlag, Int)) = [
  pinned_tuple, require_tag_tuple, hide_media_download_options_tuple,
]

pub type ChannelFlag {
  Pinned
  RequireTag
  HideMediaDownloadOptions
}

pub fn from_int(val: Int) -> List(ChannelFlag) {
  use flag_tuple <- list.filter_map(flag_tuple_list)

  case int.bitwise_and(flag_tuple.1, val) != 0 {
    True -> Ok(flag_tuple.0)
    False -> Error(Nil)
  }
}

pub fn to_int(flags: List(ChannelFlag)) -> Int {
  {
    use flag <- fn(a) { list.unique(flags) |> list.map(a) }

    case flag {
      Pinned -> pinned_tuple.1
      RequireTag -> require_tag_tuple.1
      HideMediaDownloadOptions -> hide_media_download_options_tuple.1
    }
  }
  |> list.fold(0, fn(a, b) { a + b })
}
