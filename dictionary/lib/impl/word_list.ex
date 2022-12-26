defmodule Dictionary.Impl.WordList do
  @type t :: list(String)
  #############################################
  
  @spec get_word_list() :: t
  def get_word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end
  
  @spec random_word(t) :: String.t
  def random_word(get_word_list) do
    get_word_list()
    |> Enum.random()
  end
  
  #############################################
end