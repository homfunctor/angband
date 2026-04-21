# imported by tier-personal
{inputs, ...}: {
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
