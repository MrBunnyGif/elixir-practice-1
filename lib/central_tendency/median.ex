defmodule Stats.CentralTendency.Median do
  require Integer
  alias Stats.Errors
  alias Stats.Validators

  def median(numbers_list) when is_list(numbers_list) do
    numbers_list
    |> Validators.validate_num_list()
    |> calc_median()
  end

  def median(_), do: Errors.invalid_data_type()

  defp calc_median({:err, _msg}), do: Errors.invalid_data_type()
  defp calc_median({false, _}), do: Errors.invalid_data_type()

  defp calc_median({true, numbers}) do
    count = numbers |> Enum.count()

    numbers
    |> Enum.sort()
    |> get_median(Integer.is_even(count), count)
  end

  defp get_median(numbers, false, count), do: Enum.at(numbers, div(count, 2))

  defp get_median(numbers, true, count) do
    a = Enum.at(numbers, div(count - 1, 2))
    b = Enum.at(numbers, div(count, 2))

    (a + b) / 2
  end
end
