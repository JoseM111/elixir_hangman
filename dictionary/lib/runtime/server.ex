# server.ex

defmodule Dictionary.Runtime.Server do
  @moduledoc """
   Uses the `Dictionary` `API library` to
   run it as its on `independent agent`
  
  """
  
  #`type` of our `server`
  @type t :: pid()
  #alias
  alias Dictionary.Impl.WordList
  #############################################
  def start_link do
    Agent.start_link(&WordList.get_word_list/0)
  end
  
  def random_word(pid) do
    Agent.get(pid, &WordList.random_word/1)
  end
end
###########################################