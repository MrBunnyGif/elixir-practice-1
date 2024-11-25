defmodule Stats do
  alias Stats.CentralTendency.Mean

  # def population_mean(num), do: Mean.population_mean(num)
  # mesma coisa que a linha de baixo

  defdelegate population_mean(numbers), to: Mean
end
