import gleam/list
import gleam/option.{type Option}
import gleam/result

pub type BotError(err) {
  TypeDoesNotMatch
  NameDoesNotMatch
  NotFound
  HandlerError(err)
}

pub type Bot(typ, req, ctx, res, err, def) {
  Bot(commands: List(BotCommand(typ, req, ctx, res, err, def)))
}

pub type BotFunction(req, ctx, res, err) =
  fn(req, ctx) -> Result(res, BotError(err))

pub type BotCommand(typ, req, ctx, res, err, def) {
  BotCommand(
    c_type: typ,
    execute: BotFunction(req, ctx, res, err),
    definition: Option(fn() -> def),
  )
}

pub fn handle_request(
  bot: Bot(typ, req, ctx, res, err, def),
  req: req,
  ctx: ctx,
) -> Result(res, BotError(err)) {
  list.map(bot.commands, fn(command) { command.execute(req, ctx) })
  |> list.filter(fn(result) {
    case result {
      Error(TypeDoesNotMatch) | Error(NameDoesNotMatch) -> False
      Ok(_) | Error(_) -> True
    }
  })
  |> list.first
  |> result.replace_error(NotFound)
  |> result.flatten
}
