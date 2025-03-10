defmodule ElixirLS.LanguageServer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :language_server,
      version: "0.9.0",
      elixir: ">= 1.10.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: false,
      start_permanent: true,
      build_per_environment: false,
      consolidate_protocols: false,
      deps: deps()
    ]
  end

  def application do
    [mod: {ElixirLS.LanguageServer, []}, extra_applications: [:mix, :logger]]
  end

  defp deps do
    [
      {:elixir_ls_utils, in_umbrella: true},
      {:elixir_sense, github: "elixir-lsp/elixir_sense"},
      {:erl2ex, github: "dazuma/erl2ex"},
      {:dialyxir, "~> 1.0", runtime: false},
      {:jason_vendored, github: "elixir-lsp/jason", branch: "vendored"},
      {:stream_data, "~> 0.5", only: :test},
      {:path_glob_vendored, github: "elixir-lsp/path_glob", branch: "vendored"}
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
