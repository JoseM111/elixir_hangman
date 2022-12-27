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
  
  # using the module name for the pid constant
  @pid_for_wordlist __MODULE__
  #############################################
  def start_link do
    Agent.start_link(
      &WordList.get_word_list/0,
      name: @pid_for_wordlist
    )
  end
  
  def random_word() do
    Agent.get(@pid_for_wordlist, &WordList.random_word/1)
  end
end
###########################################