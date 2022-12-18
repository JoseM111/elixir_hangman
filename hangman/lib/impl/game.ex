# game.ex
# internal data structure
defmodule Hangman.Impl.Game do
  # aliases
  alias Hangman.Impl.Game

  # type
  @type t :: %Game{
          turns_left: integer(),
          game_state: Hangman.state(),
          letters: list(String.t()),
          used: MapSet.t(String.t())
        }

  @doc "structure for the hangman game"
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  @doc "returns a fresh new game state"
  def new_game do
    %Game{
      letters:
        Dictionary.random_word()
        |> String.codepoints()
    }
  end
end
