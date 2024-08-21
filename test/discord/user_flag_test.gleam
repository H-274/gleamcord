import discord/user_flag
import gleeunit/should

pub fn from_int_single_flag_test() {
  // Given
  let staff_val = user_flag.staff_val
  let expected = [user_flag.Staff]

  // When
  let flag = user_flag.from_int(staff_val)

  // Then
  flag
  |> should.equal(expected)
}

pub fn from_int_multi_flag_test() {
  // Given
  let input =
    user_flag.staff_val
    + user_flag.active_developer_val
    + user_flag.verified_developer_val
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

pub fn to_int_single_flag_test() {
  // Given
  let flag = user_flag.Staff
  let expected = user_flag.staff_val

  // When
  let val = user_flag.to_int([flag])

  // Then
  val |> should.equal(expected)
}

pub fn to_int_multi_flag_test() {
  // Given
  let flags = [
    user_flag.ActiveDeveloper,
    user_flag.VerifiedDeveloper,
    user_flag.Staff,
  ]
  let expected =
    user_flag.staff_val
    + user_flag.active_developer_val
    + user_flag.verified_developer_val

  // When
  let val = user_flag.to_int(flags)

  // Then
  val |> should.equal(expected)
}
