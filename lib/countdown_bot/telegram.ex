defmodule CountdownBot.Telegram do
  use Tesla

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BaseUrl,
    "https://api.telegram.org/bot"
      <> Application.get_env(:countdown_bot, :bot_id)
      <> ":"
      <> Application.get_env(:countdown_bot, :bot_token)
      <> "/"

  def send_message(message, chat_id) do
    post("sendMessage", %{chat_id: chat_id, text: message})
  end
end
