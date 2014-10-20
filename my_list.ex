defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  # _head does nothing, just placeholder here (_)
  def map([], _func), do: []
  def map([item | items], func), do: [func.(item) | map(items, func)]
  # map values to something
  def reduce([], _func, total), do: total
  def reduce([item | items], func, total), do: reduce(items, func, func.(item, total))
  def reduce([item | items], func), do: reduce(items, func, func.(item, 0))
  # reduce
  def sum(items), do: reduce(items, fn(item, total)->item + total end)
end