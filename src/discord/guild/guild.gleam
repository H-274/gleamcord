import discord/emoji/emoji.{type Emoji}
import discord/guild/explicit_content_filter.{type ExplicitContentFilter}
import discord/guild/guild_feature.{type GuildFeature}
import discord/guild/mfa_level.{type MfaLevel}
import discord/guild/notification_level.{type NotificationLevel}
import discord/guild/nsfw_level.{type NsfwLevel}
import discord/guild/premium_tier.{type PremiumTier}
import discord/guild/system_channel_flag.{type SystemChannelFlag}
import discord/guild/verification_level.{type VerificationLevel}
import discord/guild/welcome_screen.{type WelcomeScreen}
import discord/permissions/role.{type Role}
import discord/snowflake.{type Snowflake}
import discord/sticker/sticker.{type Sticker}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
pub type Guild {
  Guild(
    id: Snowflake,
    name: String,
    icon: Option(String),
    icon_hash: Option(String),
    splash: Option(String),
    discovery_splash: Option(String),
    owner: Option(Bool),
    owner_id: Snowflake,
    permissions: Option(String),
    region: Option(String),
    afk_channel_id: Option(Snowflake),
    afk_timeout: Int,
    widget_enabled: Option(Bool),
    widget_channel_id: Option(Snowflake),
    verification_level: VerificationLevel,
    default_message_notifications: NotificationLevel,
    explicit_content_filter: ExplicitContentFilter,
    roles: List(Role),
    emojis: List(Emoji),
    features: List(GuildFeature),
    mfa_level: MfaLevel,
    application_id: Option(Snowflake),
    system_channel_id: Option(Snowflake),
    system_channel_flags: List(SystemChannelFlag),
    rules_channel_id: Option(Snowflake),
    max_presences: Option(Int),
    max_members: Option(Int),
    vanity_url_code: Option(String),
    description: Option(String),
    banner: Option(String),
    premium_tier: PremiumTier,
    premium_subscription_count: Option(Int),
    preferred_locale: String,
    public_updates_channel: Option(Snowflake),
    max_video_channel_users: Option(Int),
    max_stage_video_channel_users: Option(Int),
    approximate_member_count: Option(Int),
    approximate_presence_count: Option(Int),
    welcome_screen: Option(WelcomeScreen),
    nsfw_level: NsfwLevel,
    stickers: Option(List(Sticker)),
    premium_progress_bar_enabled: Bool,
    safety_alerts_channel_id: Option(Snowflake),
  )
}
