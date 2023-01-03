# game.ex

defmodule B2Web.Live.Game do
  # use behavior
  use B2Web, :live_view
  # aliases
  alias B2Web.Live.GameComponents.Figure
  alias B2Web.Live.GameComponents.Alphabet
  alias B2Web.Live.GameComponents.WordsSoFar
  ###############################################

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.get_tally(game)

    socket = socket
             |> assign(%{ game: game, tally: tally })

    { :ok, socket }
  end
  ##############################################

  def handle_event("make_move", %{ "key" => key }, socket) do
    tally = Hangman.make_move(socket.assigns.game, key)
    # update the socket
    { :noreply, assign(socket, tally: tally) }
  end
  ##############################################

  def render(assigns) do
    ~H"""
    <div class="game-holder" phx-window-keyup="make_move">
      <%= live_component(Figure, tally: assigns.tally, id: 1) %>
      <%= live_component(Alphabet, tally: assigns.tally, id: 2) %>
      <%= live_component(WordsSoFar, tally: assigns.tally, id: 3) %>
    </div>
    """
  end
  ##############################################
end
###########################################











