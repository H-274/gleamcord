import discord/allowed_mentions.{type AllowedMentions}
import discord/attachment.{type Attachment}
import discord/choice.{type Choice}
import discord/embed.{type Embed}
import discord/message_component.{type MessageComponent}
import discord/message_flag.{type MessageFlag}
import discord/poll.{type Poll}
import gleam/option.{type Option}

pub type InteractionCallbackData {
  MessageInteractionCallbackData(
    tts: Option(Bool),
    content: Option(String),
    embeds: Option(List(Embed)),
    allowed_mentions: Option(AllowedMentions),
    flags: Option(List(MessageFlag)),
    components: Option(List(MessageComponent)),
    attachments: Option(List(Attachment)),
    poll: Option(Poll),
  )
  AutocompleteInteractionCallback(choices: List(Choice))
  ModalInteractionCallback(
    custom_id: String,
    title: String,
    components: List(MessageComponent),
  )
}
