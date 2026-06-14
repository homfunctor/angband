# imported by hosts/<host>/users/<user>/settings/core.nix
# pointlessly over-complicated
#  for fun
{
  config,
  flake,
  lib,
  ...
}: let
  inherit (lib) mkIf substring toUpper;
  inherit (config.home.opts) shellName;
  # capitalize shellName
  ShellName = toUpper (substring 0 1 shellName) + substring 1 (-1) shellName;
  enableShellNameIntegration = "enable${ShellName}Integration";

  cfg = config.home.opts.shellInt;
in
  flake.lib.reqHTier config "work" {
    programs = {
      kitty = mkIf cfg.kitty.enable {
        settings.shell = config.home.opts.apps.shell.exe;
        shellIntegration.${enableShellNameIntegration} = cfg.kitty.enable;
      };

      eza.${enableShellNameIntegration} = cfg.eza.enable;
      fzf.${enableShellNameIntegration} = cfg.fzf.enable;
      nix-index.${enableShellNameIntegration} = cfg.nix-index.enable;
      starship.${enableShellNameIntegration} = cfg.starship.enable;
      yazi.${enableShellNameIntegration} = cfg.yazi.enable;
      zoxide.${enableShellNameIntegration} = cfg.zoxide.enable;
    };
  }
