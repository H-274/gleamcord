/// https://discord.com/developers/docs/topics/gateway-events#resume
pub opaque type ResumeData {
  ResumeData(token: String, session_id: String, seq: Int)
}

pub fn new(token: String, session_id: String, seq: Int) {
  ResumeData(token, session_id, seq)
}
