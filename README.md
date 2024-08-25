# gleamcord

[![Package Version](https://img.shields.io/hexpm/v/gleamcord)](https://hex.pm/packages/gleamcord)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gleamcord/)

This library aims to simplify communication with the [Discord API](https://discord.com/developers/docs/intro)
by providing ready-to-use entities to recieve and send data to the API. It also comes with some extra useful type for convenience.

> [!IMPORTANT]
> This is a library, not a framework. This does not include a web server/framework to recieve or send requests to and from the Discord API.
> This is intended to allow flexibility when it comes to choosing the best option for your use case. 
> This also helps to minimize the number of dependencies in the library.

```sh
gleam add gleamcord
```
```gleam
import gleamcord

pub fn main() {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/gleamcord>.

## Goals
- [ ] Create entities
  - This is a large task, and it may remain partially completed for some time if I decide to focus on other parts of the project
- [ ] Create handler helpers
  - Things like a `Bot` type to contain the token, the registered commands, etc.
- [ ] Create Discord Response Endpoints
- [ ] Command registration utilities

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
