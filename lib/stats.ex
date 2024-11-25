defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}

  # def population_mean(num), do: Mean.population_mean(num)
  # mesma coisa que a linha de baixo

  defdelegate population_mean(numbers), to: Mean
  defdelegate sample_mean(numbers), to: Mean

  defdelegate median(numbers), to: Median

  defdelegate mode(numbers), to: Mode
end
