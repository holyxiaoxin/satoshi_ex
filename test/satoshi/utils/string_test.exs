defmodule StringTest do
  use ExUnit.Case
  alias Satoshi.Utils.String

  doctest Satoshi

  describe "humanize" do
    test "in billions" do
      assert Satoshi.to_i(990) |> String.humanize == "99.0G"
    end

    test "in millions" do
      assert Satoshi.to_i(0.88) |> String.humanize == "88.0M"
    end

    test "in thousands" do
      assert Satoshi.to_i(0.00077) |> String.humanize == "77.0K"
    end

    test "does not match" do
      assert Satoshi.to_i(0.0000066) |> String.humanize == "660.0"
    end
  end

  describe "humanize and round" do
    test "1dp" do
      assert Satoshi.to_i(0.88888) |> String.humanize(round: 1) == "88.9M"
    end

    test "2dp" do
      assert Satoshi.to_i(0.88888) |> String.humanize(round: 2) == "88.89M"
    end
  end
end
