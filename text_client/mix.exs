defmodule TextClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :text_client,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # The included_applications key in the applications list tells
      # Elixir to load the code for an application, but also tells
      # it not to start that application. (NOTE: THIS IS RARELY USED)
#      included_applications: [ :hangman ],
      extra_applications: [ :logger ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :hangman, path: "../hangman" },
    ]
  end

  defp aliases do
    [
      setup: "deps.get",
      test: "test --cover",
    ]
  end
end
