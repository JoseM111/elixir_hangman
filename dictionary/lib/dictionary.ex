defmodule Dictionary do
  @words_list_path Path.expand("./../assets", __DIR__)
                   |> Path.join("words.txt")

  def word_list do
    @words_list_path
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def random_word do
    word_list()
    |> Enum.random()
  end
end
