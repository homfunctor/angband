# imported by tier-work
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "work" {
  programs.eza = {
    enable = true;
    icons = "always";
    colors = "always";
    extraOptions = [
      "--group-directories-first"
      "-x"
    ];
  };
}
