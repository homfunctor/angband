# a bit silly, considering nearly all video juegos are unfree,
# but it's nice to keep track of how unfree we are
{inputs, ...}: {
  # "cnijfilter2"
  # "discord"
  # "steam"
  # "steam-unwrapped"
  # "steamcmd"
  # "vivaldi"
  # "zoom"
  # <private stuff redacted>
  imports = [inputs.utumno.modules.nixos.unfree];
}
