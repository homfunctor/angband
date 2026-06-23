# a bit silly, considering nearly all video juegos are unfree,
# but it's nice to keep track of how unfree we are
{inputs, ...}: {
  imports = [
    # provides:
    # {lib, ...}: let
    #   unfreePkgs = [
    #     "cnijfilter2"
    #     "discord"
    #     "steam"
    #     "steam-unwrapped"
    #     "steamcmd"
    #     "vivaldi"
    #     "zoom"
    #
    #     <private stuff redacted>
    #   ];
    # in {
    #   nixpkgs.config.allowUnfreePredicate = pkg:
    #     builtins.elem (lib.getName pkg)
    #     unfreePkgs;
    # }
    inputs.utumno.modules.nixos.unfree
  ];
}
