# remote_hangman.ex

defmodule TextClient.Runtime.RemoteHangman do
  @remote_server :"hangman@Joses-MBP"

  def connect() do
    :rpc.call(
      @remote_server,
      Hangman,
      :new_game,
      [ ]
    )
  end


@doc """
Below I am just testing out some test atoms
    iex> alias TextClient.Runtime.RemoteHangman
    iex> RemoteHangman.log_atom()
    Elixir.TestAtom
    :test_atom
    :ok
"""
  def log_atom() do
    IO.puts(TestAtom)
    IO.puts(:test_atom)
  end
end
###########################################