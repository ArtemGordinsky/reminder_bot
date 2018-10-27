defmodule CountdownBot do
  @moduledoc """
  This is where everything comes together.
  """

  @doc """
  Sends a message to a Telegram chat announcing how many days are left until a certain date.

  Will look something like this:
  "55 days left until Christmas!" or "До Нового Года осталось 55 дней!" depending on the chosen locale.
  """
  def send_countdown_message do
    event_name = Application.get_env(:countdown_bot, :event_name)
    event_date = Application.get_env(:countdown_bot, :event_date)
    timezone = Application.get_env(:countdown_bot, :timezone)
    chat_id = Application.get_env(:countdown_bot, :chat_id)
    message_text = CountdownBot.MessageBuilder.generate_message(event_date, timezone, event_name)

    CountdownBot.Telegram.send_message(message_text, chat_id)
  end
end
