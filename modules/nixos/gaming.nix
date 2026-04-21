# imported by tier-personal
# todo: break up into directory and declare steam launch options
# civ 5 (vox populi)
#   launch options: env --unset=TZ  PROTON_ENABLE_WAYLAND=1 taskset --cpu-list 0-7 %command%
#   running with wayland fixes the "feature" of audio muting on focus loss
# lotro
#   launch options:
#     env --unset=TZ PROTON_ENABLE_WAYLAND=1 %command%
#   timezone unset otherwise it uses UTF-0
#   fps no longer drops on focus loss. wayland is magick.
#
# stellaris
#   env --unset=SDL_VIDEODRIVER %command%
{inputs, ...}: {
  imports = with inputs.nix-gaming.nixosModules; [
    pipewireLowLatency
    platformOptimizations
    wine
  ];

  programs = {
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      protontricks.enable = true;
    };

    wine.ntsync.enable = true;
  };

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 512;
    rate = 48000; # default value
  };
}
