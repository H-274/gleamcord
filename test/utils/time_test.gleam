import birl
import decode
import gleam/dynamic
import gleeunit/should
import utils/time as time_util

pub fn iso8601_string_decoder_success_test() {
  let expected_milli = 1_724_207_521_211
  let iso8601_string = dynamic.from("2024-08-21T02:32:01.211Z")

  let assert Ok(decoded) =
    time_util.iso8601_string_decoder()
    |> decode.from(iso8601_string)

  decoded
  |> birl.to_unix_milli
  |> should.equal(expected_milli)
}

pub fn iso8601_string_decoder_fail_test() {
  let iso8601_string = dynamic.from("10:10:00")

  let assert Error(_) =
    time_util.iso8601_string_decoder()
    |> decode.from(iso8601_string)
}
