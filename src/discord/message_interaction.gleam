import discord/interaction_type.{type InteractionType}
import discord/member.{type Member}
import discord/snowflake.{type Snowflake}
import discord/user.{type User}
import gleam/option.{type Option}

pub type MessageInteraction {
  MessageInteraction(
    id: Snowflake,
    i_type: InteractionType,
    name: String,
    user: User,
    member: Option(Member),
  )
}
