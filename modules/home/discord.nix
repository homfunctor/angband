# imported by tier-personal
{
  config,
  flake,
  inputs,
  ...
}: {
  imports = with inputs; [
    nixcord.homeModules.nixcord
    # plugins.*.enable
    utumno.modules.home.nixcord
  ];
  programs = flake.lib.reqHTier config "personal" {
    nixcord = {
      enable = true;

      config = {
        frameless = true;
        useQuickCss = true;
      };
    };
  };
}
