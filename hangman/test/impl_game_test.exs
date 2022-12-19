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

  test "a duplicate letter is reported" do
    game = Game.new_game()

    # should not have a used letter `x`
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state != :already_used
    # should not have a used letter `y`
    {game, _tally} = Game.make_move(game, "y")
    assert game.game_state != :already_used
    # should have a used letter `x`
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "should record letters being used" do
    game = Game.new_game()

    {game, _tally} = Game.make_move(game, "x")
    {game, _tally} = Game.make_move(game, "y")
    {game, _tally} = Game.make_move(game, "x")
    # assert all the letters entered have been used
    assert MapSet.equal?(game.used, MapSet.new(["x", "y"]))
  end

  ###########################################################

  test "recognize letter in the word" do
    game = Game.new_game("wombat")

    {_game, tally} = Game.make_move(game, "m")
    assert tally.game_state == :good_guess

    {_game, tally} = Game.make_move(game, "t")
    assert tally.game_state == :good_guess
  end

  test "recognize letter that is `not` in the word" do
    game = Game.new_game("wombat")

    # bad guess
    {_game, tally} = Game.make_move(game, "x")
    assert tally.game_state == :bad_guess
    # good guess
    {_game, tally} = Game.make_move(game, "m")
    assert tally.game_state == :good_guess
    # bad guess
    {_game, tally} = Game.make_move(game, "f")
    assert tally.game_state == :bad_guess
  end

  ###########################################################

  test "should handle a sequence of moves" do
    [
      # guess | state | turns | letters
      ["a", :bad_guess, 6, ["_", "_", "_", "_", "_"], ["a"]],
      ["a", :already_used, 6, ["_", "_", "_", "_", "_"], ["a"]],
      ["e", :good_guess, 6, ["_", "e", "_", "_", "_"], ["a", "e"]],
      ["x", :bad_guess, 5, ["_", "e", "_", "_", "_"], ["a", "e", "x"]]
    ]
    |> test_sequence_of_moves()
  end

  test "should handle a `winning` game" do
    [
      # guess | state | turns | letters
      ["a", :bad_guess, 6, ["_", "_", "_", "_", "_"], ["a"]],
      ["a", :already_used, 6, ["_", "_", "_", "_", "_"], ["a"]],
      ["e", :good_guess, 6, ["_", "e", "_", "_", "_"], ["a", "e"]],
      ["x", :bad_guess, 5, ["_", "e", "_", "_", "_"], ["a", "e", "x"]],
      ["l", :good_guess, 5, ["_", "e", "l", "l", "_"], ["a", "e", "l", "x"]],
      ["o", :good_guess, 5, ["_", "e", "l", "l", "o"], ["a", "e", "l", "o", "x"]],
      ["y", :bad_guess, 4, ["_", "e", "l", "l", "o"], ["a", "e", "l", "o", "x", "y"]],
      ["h", :won, 4, ["h", "e", "l", "l", "o"], ["a", "e", "h", "l", "o", "x", "y"]]
    ]
    |> test_sequence_of_moves()
  end

  test "should handle a `losing` game" do
    [
      # guess | state | turns | letters
      ["a", :bad_guess, 6, ["_", "_", "_", "_", "_"], ["a"]],
      ["b", :bad_guess, 5, ["_", "_", "_", "_", "_"], ["a", "b"]],
      ["c", :bad_guess, 4, ["_", "_", "_", "_", "_"], ["a", "b", "c"]],
      ["d", :bad_guess, 3, ["_", "_", "_", "_", "_"], ["a", "b", "c", "d"]],
      ["e", :good_guess, 3, ["_", "e", "_", "_", "_"], ["a", "b", "c", "d", "e"]],
      ["f", :bad_guess, 2, ["_", "e", "_", "_", "_"], ["a", "b", "c", "d", "e", "f"]],
      ["g", :bad_guess, 1, ["_", "e", "_", "_", "_"], ["a", "b", "c", "d", "e", "f", "g"]],
      ["h", :good_guess, 1, ["h", "e", "_", "_", "_"], ["a", "b", "c", "d", "e", "f", "g", "h"]],
      ["i", :lost, 0, ["h", "e", "_", "_", "_"], ["a", "b", "c", "d", "e", "f", "g", "h", "i"]]
    ]
    |> test_sequence_of_moves()
  end

  ###########################################################
  def test_sequence_of_moves(script) do
    game = Game.new_game("hello")

    # reduce to keep track of the
    # game stat as we iterate through it
    Enum.reduce(script, game, &check_one_move/2)
  end

  def check_one_move([guess, state, turns, letters, used], game = %Game{}) do
    {game, tally} = Game.make_move(game, guess)
    assert tally.game_state == state
    assert tally.turns_left == turns
    assert tally.letters == letters
    assert tally.used == used

    _move = game
  end

  ###########################################################
end
