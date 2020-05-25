defmodule PogoTest do
  use ExUnit.Case
  doctest Pogo

  test "greets the world" do
    assert Pogo.hello() == :world
  end
end
