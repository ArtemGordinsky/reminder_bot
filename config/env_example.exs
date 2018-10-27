use Mix.Config

config :countdown_bot,
  # Check out Telegram's documentation on how to go about getting these: https://core.telegram.org/bots/api
  bot_id: "###",
  bot_token: "###",
  chat_id: "###",
  event_name: "Christmas Holidays",
  event_date: ~D[2018-12-31],
  timezone: "Europe/Amsterdam"

config :countdown_bot, CountdownBot.Scheduler,
   timezone: "Europe/Amsterdam",
   jobs: [
     # Remind everyone in a chat that a New Year is coming every day at 8AM (why the hell not?).
     {"0 8 * * *", {CountdownBot, :send_countdown_message, []}},
   ]