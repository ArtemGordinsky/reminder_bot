defmodule CountdownBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :countdown_bot,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :timex],
      mod: {CountdownBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.2.0"},
      {:jason, "~> 1.1"},
      {:timex, "~> 3.4"},
      {:gettext, "~> 0.16.0"},
      {:quantum, "~> 2.3"}
    ]
  end
end
