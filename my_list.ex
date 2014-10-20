defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  # _head does nothing, just placeholder here (_)
  def map([], _func), do: []
  def map([item | items], func), do: [func.(item) | map(items, func)]
end