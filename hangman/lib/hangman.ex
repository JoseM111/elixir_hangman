defmodule Hangman do
  # aliases
  alias Hangman.Impl.Game

  # types in elixir
  @type state ::
          :initializing
          | :won
          | :lost
          | :good_guess
          | :bad_guess
          | :already_used

  @type tally :: %{
          turns_left: integer,
          game_state: state,
          letters: list(String.t()),
          used: list(String.t())
        }

  @opaque game :: Game.t()

  # def new_game do
  #   Hangman.Impl.Game.new_game()
  # end
  @spec new_game() :: game
  defdelegate new_game, to: Game

  @spec make_move(game, String.t()) :: {game, tally}
  def make_move(_game, _guess) do
    #
  end
end
