import discord/guild/welcome_screen_channel.{type WelcomeScreenChannel}
import gleam/option.{type Option}

/// https://discord.com/developers/docs/resources/guild#welcome-screen-object
pub type WelcomeScreen {
  WelcomeScreen(
    description: Option(String),
    welcome_channels: List(WelcomeScreenChannel),
  )
}
