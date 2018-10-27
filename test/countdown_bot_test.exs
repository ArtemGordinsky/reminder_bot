defmodule CountdownBotTest do
  use ExUnit.Case
  doctest CountdownBot

  test "greets the world" do
    assert CountdownBot.hello() == :world
  end
end
