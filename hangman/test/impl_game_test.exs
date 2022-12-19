# impl_game_test.exs
defmodule HangmanImplGameTest do
  use ExUnit.Case
  doctest Hangman
  # aliases
  alias Hangman.Impl.Game
  ###########################################################

  test "new_game should return a structure" do
    game = Game.new_game("wombat")
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  ###########################################################

  test "new_game should return a correct word" do
    game = Game.new_game("wombat")
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert game.letters == ["w", "o", "m", "b", "a", "t"]
  end

  ###########################################################

  test "state should not change if the game is won or lost" do
    for state <- [:won, :lost] do
      game = Game.new_game("wombat")
      # changing the game state for our test
      game = Map.put(game, :game_state, state)
      {new_game, _tally} = Game.make_move(game, "x")
      # pattern matching
      assert new_game == game
    end
  end

  ###########################################################
end
