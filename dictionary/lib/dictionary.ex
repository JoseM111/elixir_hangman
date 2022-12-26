defmodule Dictionary do
  alias Dictionary.Impl.WordList
  # opaque type
  @opaque t :: WordList.t
  #########################################
  
  @spec start() :: t
  defdelegate start(), to: WordList, as: :get_word_list
  
  @spec random_word(t) :: String.t
  defdelegate random_word(get_word_list), to: WordList
  #########################################
end
