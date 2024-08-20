import birl.{type Time}
import decode.{type Decoder}

pub fn iso8601_string_decoder() -> Decoder(Time) {
  decode.string
  |> decode.then(fn(str) {
    case birl.parse(str) {
      Ok(time) -> decode.into(time)
      // ---
      _ -> decode.fail("Time")
    }
  })
}
