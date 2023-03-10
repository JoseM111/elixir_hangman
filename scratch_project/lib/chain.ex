# chain.ex

defmodule Chain do
  def struct(
        next_node: nil,
        count: 4
      )

  def start_link(next_node) do
    spawn_link(
      Chain,
      :message_loop,
      [ %Chain{ next_node: next_node } ]
    )
    |> Process.register(:chainer)
  end

  def message_loop(%Chain{ count: 0 }) do
    IO.puts("done")
  end

  def message_loop(state = %Chain{ }) do
    receive do
      { :trigger, list } ->
        IO.inspect(list)
        :timer.sleep(500)

        send(
          { :chainer, state.next_node },
          { :trigger, [ node() | list ] }
        )
    end

    message_loop(%{ state | count: state.count -1 })
  end
end
###########################################