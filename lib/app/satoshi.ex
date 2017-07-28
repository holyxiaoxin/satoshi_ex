defmodule App.Satoshi do
  @moduledoc """
  Provides Satoshi conversion functions.

  ## Examples

      iex> Satoshi.to_i(1)
      100000000

  """
  @satoshi_unit 100_000_000

  def to_i(amount), do: round(amount * @satoshi_unit)
end
