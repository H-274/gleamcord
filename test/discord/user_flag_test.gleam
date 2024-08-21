import discord/user_flag
import gleeunit/should

pub fn from_int_single_flag_test() {
  // Given
  let staff_val = 0b1
  let expected = [user_flag.Staff]

  // When
  let flag = user_flag.from_int(staff_val)

  // Then
  flag
  |> should.equal(expected)
}

pub fn from_int_multi_flag_test() {
  // Given
  let staff_val = 0b1
  let active_dev_val = 0b10000000000000000000000
  let verified_dev_val = 0b100000000000000000
  let input = staff_val + active_dev_val + verified_dev_val
  let expected = [
    user_flag.ActiveDeveloper,
    user_flag.VerifiedDeveloper,
    user_flag.Staff,
  ]

  // When
  let flag = user_flag.from_int(input)

  // Then
  flag
  |> should.equal(expected)
}
