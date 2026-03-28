{
  config,
  inputs,
  lib,
  ...
}:
lib.mkIf config.home.opts.tier.personal.enabled {
  imports = with inputs; [
    nixcord.homeModules.nixcord
    # plugins.*.enable
    utumno.modules.home.nixcord
  ];
  programs.nixcord = {
    enable = true;

    config = {
      frameless = true;
      useQuickCss = true;
    };
  };
}
