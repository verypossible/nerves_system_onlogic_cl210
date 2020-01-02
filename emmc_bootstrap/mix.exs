defmodule EMMCBootstrap.MixProject do
  use Mix.Project

  @app :emmc_bootstrap
  @version "0.1.0"
  @all_targets [:onlogic_cl210]

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.9",
      archives: [nerves_bootstrap: "~> 1.6"],
      start_permanent: Mix.env() == :prod,
      build_embedded: true,
      aliases: [
        loadconfig: [&bootstrap/1],
        firmware: [&clean_firmware/1, "firmware", &package_firmware/1]
      ],
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_target: [run: :host, test: :host]
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.5.0", runtime: false},
      {:shoehorn, "~> 0.6"},
      {:ring_logger, "~> 0.6"},
      {:toolshed, "~> 0.2"},

      # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.6", targets: @all_targets},
      {:nerves_pack, "~> 0.2", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_onlogic_cl210, path: "../", runtime: false, targets: :onlogic_cl210}
    ]
  end

  def release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      include_erts: &Nerves.Release.erts/0,
      steps: [&Nerves.Release.init/1, :assemble],
      strip_beams: Mix.env() == :prod
    ]
  end

  def clean_firmware(_) do
    File.rm_rf!("priv")
    File.mkdir_p!("priv")
  end

  def package_firmware(args) do
    Path.join([Mix.Project.build_path(), "nerves", "images", "emmc_bootstrap.fw"])
    |> File.cp("priv/emmc_bootstrap.fw")

    Mix.Project.config() |> Mix.Project.build_structure()
    Mix.Task.reenable("release")
    Mix.Tasks.Firmware.run(args)
  end
end
