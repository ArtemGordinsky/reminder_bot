defmodule CountdownBot.MessageBuilder do
  require CountdownBot.Translation

  def generate_message(date_to, timezone, event_name) do
    case Timex.diff(date_to, Timex.now(timezone), :days) do
      num_days when num_days < 0 -> {:event_passed, nil}
      num_days -> {:ok, translate(num_days, event_name)}
    end
  end

  defp translate(num_days, event_name) do
    Gettext.ngettext(
      CountdownBot.Translation,
      "Less than a day left until %{event_name}!",
      "%{days_left} days left until %{event_name}!",
      num_days,
      event_name: event_name,
      days_left: num_days
    )
  end
end