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
  def filter([], _func, remaining), do: remaining
  def filter([item | items], func, remaining) do
    if func.(item) do
      filter(items, func, [item | remaining])
    else
      filter(items, func, remaining)
    end
  end
  def filter(items, func), do: filter(items, func, [])
  # filter the list according a value
  def is_prime(number) do
    if number > 2 do
      len(filter(generate_span(2, Float.floor(:math.sqrt(number))), fn(n)-> if rem(number, n) == 0 do true else false end end))
    else
      0
    end
  end
  # check if number is prime
  def primes(_from, _to, [], primes), do: primes
  def primes(from, to, [item | items], primes) do
    if is_prime(item) == 0 do
      primes(from, to, items, [item | primes])
    else
      primes(from, to, items, primes)
    end
  end
  def primes(from, to) when from <= to, do: primes(from, to, generate_span(from, to), [])
  # generate primes from to
end