defmodule A24.MixProject do
  use Mix.Project

  def project do
    [
      app: :a24,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.5.8"}
    ]
  end
end
