defmodule B1Web.HangmanController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    # creates pid
    game = Hangman.new_game()
    # store the tally
    tally = Hangman.get_tally(game)

    # cookie for session request
    # Puts the specified in the session for the given .
    put_session(conn, :game, game)
    # Render the given template or the default template
    # specified by the current action with the given assigns.
    render(conn, "game.html", tally: tally)
  end
end
