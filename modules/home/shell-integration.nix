# imported by hosts/<host>/users/<user>/settings/core.nix
# pointlessly over-complicated
# for fun
{
  config,
  lib,
  osConfig,
  ...
}: let
  inherit (lib) mkIf substring toUpper;
  inherit (osConfig.nixos.opts.shell) name;
  Name = toUpper (substring 0 1 name) + substring 1 (-1) name;
  enableNameIntegration = "enable${Name}Integration";

  cfg = config.home.opts.shellInt;
in {
  programs = {
    kitty = mkIf cfg.kitty.enable {
      settings.shell = config.home.opts.apps.shell.exe;
      shellIntegration.${enableNameIntegration} = cfg.kitty.enable;
    };

    eza.${enableNameIntegration} = cfg.eza.enable;
    fzf.${enableNameIntegration} = cfg.fzf.enable;
    nix-index.${enableNameIntegration} = cfg.nix-index.enable;
    starship.${enableNameIntegration} = cfg.starship.enable;
    yazi.${enableNameIntegration} = cfg.yazi.enable;
    zoxide.${enableNameIntegration} = cfg.zoxide.enable;
  };
}
