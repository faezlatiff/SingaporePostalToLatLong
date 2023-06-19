defmodule ElixirSpider.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_spider,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirSpider.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.14.0"},
      {:floki, "~> 0.33.1"},
      {:jason, "~> 1.4"}
    ]
  end




end
