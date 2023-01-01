defmodule Hangman do
  # aliases
  alias Hangman.Runtime.{ Application, Server }
  alias Hangman.Type

  @doc """
  opaque attribute to say that the internals of the
  type should remain private from anyone who imports it
  """
  @opaque game :: Server.t()
  @type tally :: Type.tally
  ##############################################################


  # def new_game do
  #   Hangman.Impl.Game.new_game()
  # end
  @spec new_game() :: game
  def new_game() do
    { :ok, pid } = Application.start_game()
    _return_new_game = pid
  end

  @spec make_move(game, String.t()) :: tally
  def make_move(game, guess) do
    GenServer.call(game, { :make_move, guess })
  end

  @spec get_tally(game) :: tally
  def get_tally(game) do
    GenServer.call(game, { :get_tally })
  end

  ##############################################################
end
