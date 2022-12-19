defmodule Hangman do
  # aliases
  alias Hangman.Impl.Game
  alias Hangman.Type
  ##############################################################

  @doc """
  opaque attribute to say that the internals of the
  type should remain private from anyone who imports it
  """
  @opaque game :: Game.t()

  # def new_game do
  #   Hangman.Impl.Game.new_game()
  # end
  @spec new_game() :: game
  defdelegate new_game, to: Game

  @spec make_move(game, String.t()) :: {game, Type.tally()}
  defdelegate make_move(game, guess), to: Game

  ##############################################################
end