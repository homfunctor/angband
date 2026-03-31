{
  config,
  inputs,
  lib,
  ...
}: {
  imports = with inputs; [
    nixcord.homeModules.nixcord
    # plugins.*.enable
    utumno.modules.home.nixcord
  ];
  programs = lib.mkIf config.home.opts.tier.personal.enabled {
    nixcord = {
      enable = true;

      config = {
        frameless = true;
        useQuickCss = true;
      };
    };
  };
}
