import discord/snowflake.{type Snowflake}

/// https://discord.com/developers/docs/interactions/message-components#select-menu-object-select-default-value-structure
pub type SelectDefaultValue {
  SelectDefaultValue(id: Snowflake, typ: DefaultValueSource)
}

pub type DefaultValueSource {
  User
  Role
  Channel
}
