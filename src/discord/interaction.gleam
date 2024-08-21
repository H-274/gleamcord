import discord/channel.{type Channel}
import discord/entitlements.{type Entitlement}
import discord/guild.{type Guild}
import discord/integration_type.{type IntegrationType}
import discord/interaction_context_type.{type InteractionContextType}
import discord/interaction_data.{type InteractionData}
import discord/interaction_type.{type InteractionType}
import discord/member.{type Member}
import discord/message.{type Message}
import discord/snowflake.{type Snowflake}
import discord/user.{type User}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

pub type Interaction {
  Interaction(
    id: Snowflake,
    application_id: Snowflake,
    i_type: InteractionType,
    data: Option(InteractionData),
    guild: Option(Guild),
    guild_id: Option(Snowflake),
    channel: Option(Channel),
    channel_id: Option(Snowflake),
    member: Option(Member),
    user: Option(User),
    token: String,
    version: Int,
    message: Option(Message),
    app_permissions: String,
    locale: Option(String),
    guild_locale: Option(String),
    entitlements: List(Entitlement),
    authorizing_integration_owners: Dict(IntegrationType, Snowflake),
    context: Option(InteractionContextType),
  )
}
