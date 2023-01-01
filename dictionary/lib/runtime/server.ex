# server.ex

defmodule Dictionary.Runtime.Server do
  @moduledoc """
   Uses the `Dictionary` `API library` to
   run it as its on `independent agent`
  """
  #`type` of our `server`
  @type t :: pid()

  @doc """
     loading behaviors into this module.
     telling `elixir` that this is a `supervised agent`
  """
  use Agent

  # using the module name for the pid constant
  @pid_for_wordlist __MODULE__

  #alias
  alias Dictionary.Impl.WordList
  #############################################
  @doc """
   Will be called by the `Supervisor`, so whatever process
   that is called will be linked to the supervisor.
  `starts` the `agent` but has to have an `unused parameter`
  """
  def start_link(_) do
    Agent.start_link(
      &WordList.get_word_list/0,
      name: @pid_for_wordlist
    )
  end

  def random_word() do
    #    if :rand.uniform < 0.33 do
    #      Agent.get(@pid_for_wordlist, fn (_) -> exit(:boom) end)
    #    end

    Agent.get(@pid_for_wordlist, &WordList.random_word/1)
  end
end
###########################################









