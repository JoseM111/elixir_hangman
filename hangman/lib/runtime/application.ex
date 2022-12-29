# application.ex

defmodule Hangman.Runtime.Application do
  # loading behaviors into this module
  use Application
  # alias
  alias Hangman.Runtime.Server
  #############################################
  @super_name GameStarter

  @doc """
    Returns the application's `supervisor`
    If the `application` `fails` then a new
    `pid` is created for when it `restarts`
  """
  def start(_type, _args) do
    supervisor_spec = [
      {
        DynamicSupervisor,
        strategy: :one_for_one,
        name: @super_name
      }
    ]

    # Starts our supervisor process and then that supervisor
    # process starts the children that we specified
    Supervisor.start_link(supervisor_spec, strategy: :one_for_one)
  end

  def start_game() do
    DynamicSupervisor.start_child(@super_name, { Server, nil })
  end
end
###########################################







