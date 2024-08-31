import discord/emoji/emoji.{type Emoji}
import discord/message/reaction_count_details.{type ReactionCountDetails}

/// https://discord.com/developers/docs/resources/message#reaction-object-reaction-structure
pub type Reaction {
  Reaction(
    count: Int,
    count_details: ReactionCountDetails,
    me: Bool,
    me_burst: Bool,
    emoji: Emoji,
    burst_colors: List(Int),
  )
}
