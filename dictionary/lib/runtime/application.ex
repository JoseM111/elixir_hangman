# application.ex

defmodule Dictionary.Runtime.Application do
  # loading behaviors into this module
  use Application
  # alias
  alias Dictionary.Runtime.Server
  #############################################
  
  def start(_type, _args) do
    Server.start_link()
  end
end
###########################################







