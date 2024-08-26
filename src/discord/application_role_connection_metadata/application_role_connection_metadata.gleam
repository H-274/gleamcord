import discord/application_role_connection_metadata/application_role_connection_metadata_type.{
  type ApplicationRoleConnectionMetadataType,
}
import gleam/dict.{type Dict}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/application-role-connection-metadata#application-role-connection-metadata-object-application-role-connection-metadata-structure
pub type ApplicationRoleConnectionMetadata {
  ApplicationRoleConnectionMetadata(
    typ: ApplicationRoleConnectionMetadataType,
    key: String,
    name: String,
    name_localizations: Option(Dict(String, String)),
    description: String,
    description_localizations: Option(Dict(String, String)),
  )
}
