defmodule EMMCBootstrap do
  def fw_update() do
    fw_file = Application.app_dir(:emmc_bootstrap, "/priv/emmc_bootstrap.fw")
    IO.puts("Starting to write firmware")

    System.cmd("fwup", ["-a", "-i", fw_file, "-t", "complete", "-d", "/dev/mmcblk1"],
      into: IO.stream(:stdio, :line),
      stderr_to_stdout: true
    )
  end
end
