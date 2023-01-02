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

    conn
    |> put_session(:game, game)
    |> render("game.html", tally: tally)

    #    # cookie for session request
    #    # Puts the specified in the session for the given .
    #    conn = put_session(conn, :game, game)
    #    # Render the given template or the default template
    #    # specified by the current action with the given assigns.
    #    render(conn, "game.html", tally: tally)
  end

  def update(conn, params) do
    #
    guess = params[ "make_move" ][ "guess" ]

    tally =
      conn
      |> get_session(:game)
      |> Hangman.make_move(guess)

    put_in(conn.params[ "make_move" ][ "guess" ], "")
    |> render("game.html", tally: tally)

    #    # getting the game session from
    #    # the `put_session(conn, :game, game)`
    #    game = get_session(conn, :game)
    #
    #    tally = Hangman.make_move(game, guess)
    #    # making the form clear to an empty string after a guessed letter
    #    conn = put_in(conn.params["make_move"]["guess"], "")
    #
    #    render(conn, "game.html", tally: tally)
  end
end







