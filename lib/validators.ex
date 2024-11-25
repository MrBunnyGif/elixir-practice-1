defmodule Stats.Validators do
  alias Stats.Errors

  @spec validate_num_list(list(number())) :: {boolean(), list(number())} | {atom(), String.t()}
  def validate_num_list(numbers) when is_list(numbers) do
    {Enum.all?(numbers, fn e -> is_number(e) end), numbers}
  end

  def validate_num_list(_), do: Errors.invalid_data_type()
end
