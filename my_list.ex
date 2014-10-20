defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  # _head does nothing, just placeholder here (_)
  def map([], _func), do: []
  def map([item | items], func), do: [func.(item) | map(items, func)]
  # map values to something
  def reduce([], _func, total), do: total
  def reduce([item | items], func, total), do: reduce(items, func, func.(item, total))
  # reduce
  def sum(items), do: reduce(items, fn(item, total)->item + total end, 0)
  # sums items in list
  def max(items), do: reduce(items, fn(item, total)->if item > total do item else total end end, 0)
  # finds max in list
  def generate_span(from, to) when from > to, do: []
  def generate_span(from, to) when from <= to, do: [from | generate_span(from + 1, to)]
  # span from to
end