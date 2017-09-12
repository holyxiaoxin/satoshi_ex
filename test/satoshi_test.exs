defmodule SatoshiTest do
  use ExUnit.Case

  doctest Satoshi

  describe "converts to satoshi unit" do
    test "in non-exponent units even for large numbers" do
      assert Satoshi.to_i(1) == 100_000_000
    end

    test "in non-exponent units for small numbers" do
      assert Satoshi.to_i(0.00001) == 1_000
    end
  end
end
