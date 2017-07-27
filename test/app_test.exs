defmodule AppTest do
  use ExUnit.Case
  alias App.Satoshi

  doctest App

  describe "converts to satoshi unit" do
    test "in non-exponent units even for large numbers" do
      assert Satoshi.to_i(1) == 100_000_000
    end

    test "in non-exponent units for small numbers" do
      assert Satoshi.to_i(0.00001) == 1_000
    end
  end

  describe "humanize" do
    test "in billions" do
      assert Satoshi.to_i(990) |> Satoshi.humanize == "99.0G"
    end

    test "in millions" do
      assert Satoshi.to_i(0.88) |> Satoshi.humanize == "88.0M"
    end

    test "in thousands" do
      assert Satoshi.to_i(0.00077) |> Satoshi.humanize == "77.0K"
    end

    test "does not match" do
      assert Satoshi.to_i(0.0000066) |> Satoshi.humanize == "660.0"
    end
  end

  describe "humanize and round" do
    test "1dp" do
      assert Satoshi.to_i(0.88888) |> Satoshi.humanize(round: 1) == "88.9M"
    end

    test "2dp" do
      assert Satoshi.to_i(0.88888) |> Satoshi.humanize(round: 2) == "88.89M"
    end
  end

  describe "humanize and round significant figures" do
    test "handle 0, doesn't error out" do
      assert Satoshi.to_sf(0, 3) == 0
    end

    test "handle 0.0, doesn't error out" do
      assert Satoshi.to_sf(0.0, 3) == 0
    end

    test "3sf for large integer" do
      assert Satoshi.to_sf(12345678, 3) == 12300000
    end

    test "3sf for large float" do
      assert Satoshi.to_sf(12345678.0, 3) == 12300000
    end

    test "3sf for float less than 1" do
      assert Satoshi.to_sf(0.05555, 3) == 0.0556
    end
  end
end
