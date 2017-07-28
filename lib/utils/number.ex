defmodule Utils.Number do
  @doc """
  Converts Int to x Significant Figures.

  Returns an Integer.

  ## Examples

      iex> Number.to_sf(0.05555, 3)
      0.0556

  """

  def to_sf(amount, _) when amount == 0, do: 0

  def to_sf(amount, sf) do
    round_amount = sf - round(Float.ceil(Math.log10(amount)))
    if round_amount < 0 do
      x = String.to_integer("1" <> String.duplicate("0", -round_amount))
      round(amount/x) * x
    else
      Float.round(amount, round_amount)
    end
  end
end
