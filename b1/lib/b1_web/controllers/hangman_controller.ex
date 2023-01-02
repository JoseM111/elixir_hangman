defmodule B1Web.HangmanController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    # creates pid
    game = Hangman.new_game()

    conn
    |> put_session(:game, game)
    |> redirect(to: Routes.hangman_path(conn, :show))

    #    # cookie for session request
    #    # Puts the specified in the session for the given .
    #    conn = put_session(conn, :game, game)
    #    # Render the given template or the default template
    #    # specified by the current action with the given assigns.
    #    render(conn, "game.html", tally: tally)
  end

  def update(conn, params) do
    # "make_move" => %{"guess" => "k"}
    guess = params[ "make_move" ][ "guess" ]

    # passes conn down the pipeline
    put_in(conn.params[ "make_move" ][ "guess" ], "")
    |> get_session(:game)
    |> Hangman.make_move(guess)

    redirect(conn, to: Routes.hangman_path(conn, :show))
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

  def show(conn, _params) do
    tally =
      conn
      |> get_session(:game)
      |> Hangman.get_tally()

    render(conn, "game.html", tally: tally)
  end
end



















