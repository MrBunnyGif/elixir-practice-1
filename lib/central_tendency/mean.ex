defmodule Stats.CentralTendency.Mean do
  alias Stats.{Errors, Validators}

  @spec population_mean([number()]) :: number() | {atom(), String.t()}
  def population_mean([]), do: Errors.invalid_data_type()
  # roda quando for lista
  def population_mean(numbers) when is_list(numbers) do
    numbers |> Validators.validate_num_list() |> calc_population_mean()
  end

  # chamado quando não se encaixa com nenhuma chamada acima
  def population_mean(_), do: Errors.invalid_data_type()

  @spec sample_mean([number()]) :: number() | {atom(), String.t()}
  def sample_mean(numbers), do: population_mean(numbers)

  defp calc_population_mean({false, _}), do: Errors.invalid_data_type()

  defp calc_population_mean({true, numbers}) do
    numbers |> Enum.sum() |> mean(Enum.count(numbers))
  end

  defp mean(sigma, count), do: sigma / count
end
