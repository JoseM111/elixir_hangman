defmodule TextClient do
  alias TextClient.Runtime.RemoteHangman
  alias TextClient.Impl.Player
  ###############################################
  @doc """
  If you have experience with `Java` you could think
  about specification as an `interface`. `Specification
  defines what should be the type of function’s`
  parameters and of it’s return value. To define input
  and output types we use the `@spec directive` `placed right
  before the function definition` and taking as a params the
  name of the function, a list of `parameter types`, and
  after `::` `the type of the return value`.
  """
  @spec start() :: :ok
  def start() do
    RemoteHangman.connect()
    |> Player.start()
  end
end


















