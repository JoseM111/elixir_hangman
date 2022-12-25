# player.ex
defmodule TextClient.Impl.Player do
  # aliases
  @alias TextClient.Impl.Player
  # types & struct types
  @type game :: Hangman.game
  @type tally :: Hangman.tally
  @type state :: { game, tally }
  ##############################################################
  
  @spec start() :: :ok
  def start() do
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
  
  def interact({ _game, tally = %{ game_state: :won } }) do
    IO.puts(
      "Sorry. You lost... the word was #{
        tally.letters
        |> Enum.join()
      }"
    )
  end
  
  # this last case handles just a normal move in the game
  def interact({game, tally}) do
    # feedback
    IO.puts(feedback_for(tally))
    
    # display current word
    # get next guess
    # make a move
#    interact()
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
    
#  def feedback_for(tally = %{ game_state: :initializing }) do
#    _feedback_response = "Welcome! I'm thinking of a #{
#      tally.letters
#      |> length()
#    } letter word"
#  end
#
#  def feedback_for(tally = %{ game_state: :good_guess }), do: "Good guess!"
#
#  def feedback_for(tally = %{ game_state: :bad_guess }) do
#    _feedback_response = "Sorry, that letter is not in the word"
#  end
#
#  def feedback_for(tally = %{ game_state: :already_used }) do
#    _feedback_response = "You've already guessed that letter"
#  end
  
  end
  ##############################################################
end










