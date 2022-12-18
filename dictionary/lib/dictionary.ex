defmodule Dictionary do
  # module-attribute (read at compile time)
  @words_list_path Path.expand("./../assets", __DIR__)
                   |> Path.join("words.txt")
                   |> File.read!()
                   |> String.split(~r/\n/, trim: true)

  def random_word do
    @words_list_path
    |> Enum.random()
  end
end
