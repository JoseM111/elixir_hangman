# player.ex
defmodule TextClient.Impl.Player do
  # aliases
  #  @alias TextClient.Impl.Player
  # types & struct types
  @type game :: Hangman.game
  @type tally :: Hangman.tally
  @type state :: { game, tally }
  ##############################################################

  @spec start(game) :: :ok
  def start(game) do
    # getting a game
    game = Hangman.new_game()
    tally = Hangman.get_tally(game)
    interact({ game, tally })
  end

  ##############################################################

  @doc """
  @type state ::
          :initializing
          | :won
          | :lost
          | :good_guess
          | :bad_guess
          | :already_used
  """
  @spec interact(state) :: :ok
  def interact({ _game, _tally = %{ game_state: :won } }) do
    IO.puts("Congratulations. You won!")
  end

  def interact({ _game, tally = %{ game_state: :lost } }) do
    IO.puts(
      "Sorry. You lost... the word was #{
        tally.letters
        |> Enum.join()
      }"
    )
  end

  # this last case handles just a normal move in the game
  def interact({ game, tally }) do
    # feedback
    IO.puts(feedback_for(tally))
    # display current word
    IO.puts(current_word(tally))
    # get next guess

    # make a move
    tally = Hangman.make_move(game, get_guess())
    # passing the arguments into interact of the updated state
    interact({ game, tally })
  end

  ##############################################################

  def feedback_for(tally) do
    case tally do
      %{ game_state: :initializing } -> "Welcome! I'm thinking of a #{
        tally.letters
        |> length()
      } letter word"
      %{ game_state: :good_guess } -> "Good guess!"
      %{ game_state: :bad_guess } -> "Sorry, that letter is not in the word"
      %{ game_state: :already_used } -> "You've already guessed that letter"
      _ -> "No tally 🤷🏾‍"
    end
  end
  #  def feedback_for(tally = %{ game_state: :initializing }) do
  #    _feedback_response = "Welcome! I'm thinking of a #{
  #      tally.letters
  #      |> length()
  #    } letter word"
  #  end
  #
  #  def feedback_for(%{ game_state: :good_guess }), do: "Good guess!"
  #
  #  def feedback_for(%{ game_state: :bad_guess }) do
  #    _feedback_response = "Sorry, that letter is not in the word"
  #  end
  #
  #  def feedback_for(%{ game_state: :already_used }) do
  #    _feedback_response = "You've already guessed that letter"
  #  end

  ##############################################################

  def current_word(tally) do
    _word_response = [
      "Word so far: ",
      tally.letters
      |> Enum.join(" "),
      "  turns left: ",
      tally.turns_left
      |> to_string,
      "  used so far: ",
      tally.used
      |> Enum.join(",")
    ]
  end

  ##############################################################

  def get_guess() do
    # need to fetch a string
    # prompt to enter the next letter
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end
  ##############################################################
end