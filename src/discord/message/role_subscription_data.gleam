import discord/snowflake.{type Snowflake}

/// https://discord.com/developers/docs/resources/message#role-subscription-data-object
pub type RoleSubscriptionData {
  RoleSubscriptionData(
    role_subscription_listing_id: Snowflake,
    tier_name: String,
    total_months_subscribed: Int,
    is_renewal: Bool,
  )
}
