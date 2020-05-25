defmodule Pogo.MixProject do
  use Mix.Project

  def project do
    [
      app: :pogo,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      project: [
        licenses: ["Apache 2"],
        links: %{
          "Repository" => "https://github.com/commonspub/pogo",
          # "Hexdocs" => "https://hexdocs.pm/pogo"
        }
      ],
      docs: [
        name: "Pogo",
        main: "readme",
        source_url: "https://github.com/commonspub/pogo",
        extras: [ "README.md" ],
      ],
      deps: deps(),
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.4"},
      {:ecto_function, "~> 1.0"},
    ]
  end
end
