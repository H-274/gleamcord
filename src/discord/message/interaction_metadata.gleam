import discord/api/interactions/interaction_type.{type InteractionType}
import discord/application/integration_type.{
  type ApplicationIntegrationType as IntegrationType,
}
import discord/snowflake.{type Snowflake}
import discord/user/user.{type User}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/message#message-interaction-metadata-object-message-interaction-metadata-structure
pub type InteractionMetadata {
  InteractionMetadata(
    id: Snowflake,
    typ: InteractionType,
    user: User,
    authorizing_integration_owners: Dict(IntegrationType, Snowflake),
    original_response_message_id: Option(Snowflake),
    interacted_message_id: Option(Snowflake),
    triggering_interaction_metadata: Option(InteractionMetadata),
  )
}
