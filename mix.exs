defmodule CountdownBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :countdown_bot,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :timex],
      mod: {CountdownBot.Application, []}
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.2.0"},
      {:jason, "~> 1.1"},
      {:timex, "~> 3.4"},
      {:gettext, "~> 0.16.0"},
      {:quantum, "~> 2.3"},
      {:distillery, "~> 2.0"}
    ]
  end
end
