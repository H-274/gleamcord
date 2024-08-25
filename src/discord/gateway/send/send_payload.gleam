import discord/gateway/send/send_event.{type SendEvent}
import gleam/option.{type Option, None, Some}

/// https://discord.com/developers/docs/topics/gateway-events#payload-structure
pub opaque type SendPayload {
  SendPayload(op: Int, d: Option(SendEvent), s: Option(Int), t: Option(String))
}

pub fn new(op: Int) -> SendPayload {
  SendPayload(op, None, None, None)
}

pub fn set_d(payload: SendPayload, d: SendEvent) -> SendPayload {
  SendPayload(..payload, d: Some(d))
}

pub fn set_s(payload: SendPayload, s: Int) {
  SendPayload(..payload, s: Some(s))
}

pub fn set_t(payload: SendPayload, t: String) {
  SendPayload(..payload, t: Some(t))
}
