import birl
import decode
import gleam/dynamic
import gleeunit/should
import utils/time as time_util

pub fn iso8601_string_decoder_success_test() {
  // Given
  let expected_milli = 1_724_207_521_211
  let iso8601_string = dynamic.from("2024-08-21T02:32:01.211Z")

  // When
  let assert Ok(decoded) =
    time_util.iso8601_string_decoder()
    |> decode.from(iso8601_string)

  // Then
  decoded
  |> birl.to_unix_milli
  |> should.equal(expected_milli)
}

pub fn iso8601_string_decoder_fail_test() {
  // Given
  let iso8601_string = dynamic.from("10:10:00")

  // When
  let time =
    time_util.iso8601_string_decoder()
    |> decode.from(iso8601_string)

  // Then
  time |> should.be_error
}
