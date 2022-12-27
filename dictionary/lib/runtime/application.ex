# application.ex

defmodule Dictionary.Runtime.Application do
  # loading behaviors into this module
  use Application
  # alias
  alias Dictionary.Runtime.Server
  alias Dictionary.Runtime
  #############################################
  
  @doc """
    Returns the application's `supervisor`
    If the `application` `fails` then a new
    `pid` is created for when it `restarts`
  """
  def start(_type, _args) do
    children = [ { Server, [ ] } ]
    options = [
      # Supervisor name
      name: Runtime.Supervisor,
      # Restart `process` and only `restart`
      # that one `process` if it `fails`
      strategy: :one_for_one,
    ]
    
    # Starts our supervisor process and then that supervisor
    # process starts the children that we specified
    Supervisor.start_link(children, options)
  end
end
###########################################







