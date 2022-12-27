defmodule Dictionary.MixProject do
  use Mix.Project
  
  def project do
    [
      app: :dictionary,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_options: [
        debug_info: Mix.env() == :dev
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end
  
  # Run "mix help compile.app" to learn about applications.
  # Returns a list of the applications to be started
  def application do
    [
      mod: { Dictionary.Runtime.Application, [ ] },
      extra_applications: [ :logger ]
    ]
  end
  
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
  
  def aliases do
    [
      setup: [ "dep.get" ]
    ]
  end
end
