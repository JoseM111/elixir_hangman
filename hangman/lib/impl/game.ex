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
  def make_move(%Game{game_state: state} = game, _guess)
      when state in [:won, :lost] do
    game
    |> return_with_tally()
  end

  def make_move(%Game{} = game, guess) do
    # MapSet.member?: the question mark
    # means its a predicate? true/false
    accept_guess(game, guess, MapSet.member?(game.used, guess))
    |> return_with_tally()
  end

  ##############################################################

  defp get_tally(%Game{} = game) do
    %{
      turns_left: game.turns_left,
      game_state: game.game_state,
      letters: reveal_guessed_letters(game),
      used:
        game.used
        |> MapSet.to_list()
        |> Enum.sort()
    }
  end

  defp return_with_tally(%Game{} = game) do
    _tally = {game, get_tally(game)}
  end

  ##############################################################

  # if we already picked a letter than
  # the thirs parameter will be true by default
  defp accept_guess(%Game{} = game, _guess, _already_used = true) do
    _updated_game_state = %{game | game_state: :already_used}
  end

  defp accept_guess(game = %Game{}, guess, _already_used) do
    _used_guess =
      %Game{game | used: MapSet.put(game.used, guess)}
      |> guess_score(Enum.member?(game.letters, guess))
  end

  ##############################################################

  defp guess_score(%Game{} = game, _correct_guess = true) do
    # if the player guesses all the letters? -> :won | _correct_guess
    # `abcomtw` is a sub-set of `wombat` <- (same letters)
    # ⤵️ Checks if map_set1's members are all contained in map_set2
    new_game_state =
      MapSet.new(game.letters)
      |> MapSet.subset?(game.used)
      |> possibly_won()

    %{game | game_state: new_game_state}
  end

  defp guess_score(%Game{turns_left: 1} = game, _incorrect_guess) do
    # if :turns_left == 1 -> :lost | -decrease :turns_left, :bad_guess
    # if the player guesses all the letters?-> :won
    _lost_game = %{
      game
      | game_state: :lost,
        turns_left: 0
    }
  end

  defp guess_score(%Game{} = game, _incorrect_guess) do
    # if :turns_left == 1 -> :lost | -decrease :turns_left, :bad_guess
    # if the player guesses all the letters?-> :won
    _bad_guess_decrement_turns_left = %{
      game
      | game_state: :bad_guess,
        turns_left: game.turns_left - 1
    }
  end

  ##############################################################

  defp reveal_guessed_letters(%Game{} = game) do
    game.letters
    |> Enum.map(fn letter ->
      MapSet.member?(game.used, letter)
      |> reveal_letter(letter)
    end)
  end

  defp possibly_won(_won_game = true), do: :won
  defp possibly_won(_), do: :good_guess

  defp reveal_letter(_is_letter = true, letter), do: letter
  defp reveal_letter(_, _letter), do: "_"

  ##############################################################
end
