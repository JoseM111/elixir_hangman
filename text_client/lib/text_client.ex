defmodule TextClient do
  @doc """
  If you have experience with `Java` you could think
  about specification as an `interface`. `Specification
  defines what should be the type of a function’s`
  parameters and of it’s return value. To define input
  and output types we use the `@spec directive` `placed right
  before the function definition` and taking as a params the
  name of the function, a list of `parameter types`, and
  after `::` `the type of the return value`.
  """
  @spec start() :: :ok
  defdelegate start(), to: TextClient.Impl.Player
end
