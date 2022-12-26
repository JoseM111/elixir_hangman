defmodule Dictionary do
  alias Dictionary.Runtime.Server
  # opaque type
  @opaque t :: Server.t
  #########################################
  
  @spec start_link() :: { :ok, t }
  defdelegate start_link(), to: Server
  
  @spec random_word(t) :: String.t
  defdelegate random_word(get_word_list), to: Server
  #########################################
end
