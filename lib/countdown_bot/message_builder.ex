defmodule CountdownBot.MessageBuilder do
  require CountdownBot.Translation

  def generate_message(date_to, timezone, event_name) do
    num_days_left = Timex.diff(date_to, Timex.now(timezone), :days)

    translate(num_days_left, event_name)
  end

  defp translate(num_days, _) when num_days < 0 do nil end

  defp translate(num_days, event_name) do
    Gettext.ngettext(
      CountdownBot.Translation,
      "Less than a day left until %{days_left}!",
      "%{days_left} days left until %{event_name}!",
      num_days,
      event_name: event_name,
      days_left: num_days
    )
  end


end