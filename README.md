# Countdown Bot 🤖

Mostly just a (pretty lame) excuse to play with Elixir, Telegram's bot API and a Raspberry PI I had laying around.

Sends a message to Telegram reminding everyone about how many days are left until a certain event. 

Tried to make it at least somewhat abstract in case someone else wants to use the code.

## Usage

1. Create a Telegram bot (read the [docs](https://core.telegram.org/bots/api) if you don't know how it's done).
2. Invite it to a Telegram group you want to use it in (just as you would a regular person).
3. Call Telegram's `/getUpdates` endpoint, providing your bot's credentials.
4. Get a `chat_id` from the response.
5. Add your configuration to `/config/{env}.exs` (check out `env_example.exs`).
6. Run `mix deps.get` to install the dependencies, assuming you have already installed Elixir.
7. Deploy as a regular app or run in the console for debugging (`iex -S mix`).
8. Enjoy an annoying automated message every hour/day/week until the day of the event 🎉
