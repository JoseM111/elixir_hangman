# memory_display.ex

defmodule MemoryWeb.Live.MemoryDisplay do
  use MemoryWeb, :live_view

  @doc """
    `Process.send_after(dest, msg, time, opts \\ [])`
    Sends msg to dest after time milliseconds
  """
  def mount(_params, _session, socket) do
    { :ok, schedule_tick_and_update(socket) }
  end

  @doc """
    To handle `Process.send_after`
  """
  def handle_info(:tick, socket) do
    { :noreply, schedule_tick_and_update(socket) }
  end

  defp schedule_tick_and_update(socket) do
    Process.send_after(self(), :tick, 1000)
    socket = assign(socket, :memory, :erlang.memory)
  end
  #########################################################
  @doc """
    Think of assigns as being a data structure that gets passed
    back and forth between the client and the server. Both ends
    can place values in the assigns, and both can read from it.
    Part of the magic of assigns is that the server keeps track
    of changes you make.
  """

  def render(assigns) do
    ~H"""
    <table>
      <%= for {name, value} <- assigns.memory do %>
        <tr>
          <th><%= name %></th>
          <td><%= value %></td>
        </tr>
      <% end %>
    </table>
    """
  end
  #########################################################
end




