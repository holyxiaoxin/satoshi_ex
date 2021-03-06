defmodule Satoshi.Mixfile do
  use Mix.Project

  def project do
    [app: :satoshi_ex,
     version: "0.1.5",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:math, "~> 0.3.0"},
      {:ex_doc, "~> 0.14", only: :dev},
    ]
  end

  defp description do
    """
    Converts BTC to Satoshi, with some helper utils meant to work with
    tracking/converting cryptocurrencies.
    """
  end

  defp package do
    [
      name: :satoshi_ex,
      # files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      maintainers: ["Jia Rong"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/holyxiaoxin/satoshi_ex"}
    ]
  end
end
