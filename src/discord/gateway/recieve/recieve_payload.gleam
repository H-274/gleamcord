import discord/gateway/recieve/recieve_event.{type RecieveEvent}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#payload-structure
pub opaque type RecievePayload {
  RecievePayload(
    op: Int,
    d: Option(RecieveEvent),
    s: Option(Int),
    t: Option(String),
  )
}

pub fn new(op: Int) -> RecievePayload {
  RecievePayload(op, None, None, None)
}

pub fn set_d(payload: RecievePayload, d: RecieveEvent) -> RecievePayload {
  RecievePayload(..payload, d: Some(d))
}

pub fn set_s(payload: RecievePayload, s: Int) -> RecievePayload {
  RecievePayload(..payload, s: Some(s))
}

pub fn set_t(payload: RecievePayload, t: String) -> RecievePayload {
  RecievePayload(..payload, t: Some(t))
}
