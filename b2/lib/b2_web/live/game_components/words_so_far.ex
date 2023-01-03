# words_so_far.ex

defmodule B2Web.Live.GameComponents.WordsSoFar do
  # use behavior
  use B2Web, :live_component
  ##############################################
  # module attribute
  @states %{
    already_used: "You already picked that letter",
    bad_guess: "That's not in the word",
    good_guess: "Good guess!",
    initializing: "Type or input your first guess",
    lost: "Sorry, you lost...",
    won: "You won!",
  }
  ##############################################

  def mount(_params, _session, socket) do
    { :ok, socket }
  end

  defp state_name(state) do
    @states[ state ] || "Unknown state"
  end
  ##############################################

  def render(assigns) do
    ~H"""
    <div class="word-so-far">
      <div class="game-state">
        <%= state_name(@tally.game_state) %>
      </div>

      <div class="letters">
        <%= for char <- @tally.letters do %>
          <div class={"#{if char != '_', do: 'correct'} one-letter"}>
            <%= char %>
          </div>
        <% end %>
      </div>
    </div>
    """

    # liveview 0.17
    # <div class="letters">
    #    <%= for char <- @tally.letters do %>
    #      <% cls = if char != "_", do: "one-letter correct", else: "one-letter" %>
    #        <div class={cls}>
    #          <%= char %>
    #        </div>
    #    <% end %>
    #    </div>
  end
  ##############################################
end
###########################################