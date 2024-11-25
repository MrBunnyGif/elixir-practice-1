defmodule Stats.CentralTendency.Mode do
  def mode(numbers) when is_list(numbers) do
    ranked_map = numbers |> Enum.frequencies()
    ranked_map |> Map.values() |> Enum.max() |> mode_func(ranked_map)
  end

  defp mode_func(1, _ranked_map), do: nil

  defp mode_func(max, ranked_map) do
    ranked_map
    |> Map.filter(fn {_key, value} -> value == max end)
    |> Map.keys()
  end
end
