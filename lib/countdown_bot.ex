defmodule CountdownBot do
  @moduledoc """
  This is where everything comes together.
  """

  require Logger

  @doc """
  Sends a message to a Telegram chat announcing how many days are left until a certain date.

  Will look something like this:
  "55 days left until Christmas!" or "До Нового Года осталось 55 дней!" depending on the chosen locale.
  """
  def send_countdown_message do
    event_name = Application.get_env(:countdown_bot, :event_name)
    event_date = Application.get_env(:countdown_bot, :event_date)
    timezone = Application.get_env(:countdown_bot, :timezone)

    case CountdownBot.MessageBuilder.generate_message(event_date, timezone, event_name) do
      {:event_passed, _} -> Logger.warn("Event date has already passed, message was not posted", application: :warning)
      {:ok, message} -> send_message(message)
    end
  end

  defp send_message(message) do
    chat_id = Application.get_env(:countdown_bot, :chat_id)

    case CountdownBot.Telegram.send_message(message, chat_id) do
      {:ok, %Tesla.Env{body: %{"ok" => true}}} -> Logger.info("Message sent successfully", application: :info)
      {_, response} -> Logger.warn("Message sending failed, status: #{response.status}", application: :warning)
    end
  end
end
