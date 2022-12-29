# server.ex

defmodule Hangman.Runtime.Server do
  # type for server
  @type t :: pid()
  # aliases
  alias Hangman.Impl.Game
  # get the GenServer behaviour
  use GenServer
  #############################################

  @doc """
   `client process`
   This function is being called in the
   context of any client that is using it.
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @doc """
  `server` process `callback`
  """
  def init(_) do
    _return_state = { :ok, Game.new_game() }
  end

  def handle_call({ :make_move, guess }, _from, game) do
    { updated_game, tally } = Game.make_move(game, guess)
    { :reply, tally, updated_game }
  end

  def handle_call({ :get_tally }, _from, game) do
    { :reply, Game.get_tally(game), game }
  end
end
###########################################