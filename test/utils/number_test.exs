defmodule NumberTest do
  use ExUnit.Case
  alias Utils.Number

  doctest App

  describe "humanize and round significant figures" do
    test "handle 0, doesn't error out" do
      assert Number.to_sf(0, 3) == 0
    end

    test "handle 0.0, doesn't error out" do
      assert Number.to_sf(0.0, 3) == 0
    end

    test "3sf for large integer" do
      assert Number.to_sf(12345678, 3) == 12300000
    end

    test "3sf for large float" do
      assert Number.to_sf(12345678.0, 3) == 12300000
    end

    test "3sf for float less than 1" do
      assert Number.to_sf(0.05555, 3) == 0.0556
    end
  end
end
