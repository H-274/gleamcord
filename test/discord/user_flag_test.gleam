import discord/user_flag
import gleam/list
import gleeunit/should

pub fn from_int_single_flag_test() {
  // Given
  let flag_val = user_flag.staff_val
  let expected = [user_flag.Staff]

  // When
  let flag = user_flag.from_int(flag_val)

  // Then
  flag
  |> should.equal(expected)
}

pub fn from_int_multi_flag_test() {
  // Given
  let flag_values =
    user_flag.staff_val
    + user_flag.active_developer_val
    + user_flag.verified_developer_val
  let expected = [
    user_flag.Staff,
    user_flag.ActiveDeveloper,
    user_flag.VerifiedDeveloper,
  ]

  // When
  let flags = user_flag.from_int(flag_values)

  // Then
  flags
  |> list.all(fn(flag) { list.contains(expected, flag) })
  |> should.be_true
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

pub fn from_int_to_int_equals_test() {
  // Given
  let flag_values =
    user_flag.staff_val
    + user_flag.active_developer_val
    + user_flag.verified_developer_val

  // When
  let flags = user_flag.from_int(flag_values)
  let result_values = user_flag.to_int(flags)

  // Then
  result_values |> should.equal(flag_values)
}

pub fn to_int_from_int_equals_test() {
  // Given
  let flags = [
    user_flag.ActiveDeveloper,
    user_flag.VerifiedDeveloper,
    user_flag.Staff,
  ]

  // When
  let flag_values = user_flag.to_int(flags)
  let result_flags = user_flag.from_int(flag_values)

  // Then
  result_flags
  |> list.all(fn(flag) { list.contains(flags, flag) })
  |> should.be_true
}
