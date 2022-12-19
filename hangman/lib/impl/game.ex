# game.ex
# internal data structure
defmodule Hangman.Impl.Game do
  # aliases
  alias Hangman.Impl.Game
  alias Hangman.Type
  ##############################################################

  # type
  @type t :: %__MODULE__{
          turns_left: integer(),
          game_state: Type.state(),
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

  ##############################################################

  @spec new_game :: Game.t()
  @doc "returns a fresh new game state"
  def new_game do
    # new_game/1 ⏬
    new_game(Dictionary.random_word())
  end

  @spec new_game(String.t()) :: Game.t()
  def new_game(word) do
    %__MODULE__{
      letters: word |> String.codepoints()
    }
  end

  ##############################################################

  @spec make_move(Game.t(), String.t()) :: {Game.t(), Type.tally()}
  def make_move(game = %{game_state: state}, _guess)
      when state in [:won, :lost] do
    {game, get_tally(game)}
  end

  # @spec make_move(Game.t(), String.t()) :: {Game.t(), Type.tally()}
  # def make_move(game = %{game_state: :lost}, _guess) do
  #   {game, get_tally(game)}
  # end

  defp get_tally(game) do
    %{
      turns_left: game.turns_left,
      game_state: game.game_state,
      letters: [],
      used:
        game.used
        |> MapSet.to_list()
        |> Enum.sort()
    }
  end

  ##############################################################
end
