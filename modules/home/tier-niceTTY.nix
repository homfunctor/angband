# imported by hosts/<host>/users/<user>/settings/core.nix
{
  flake,
  pkgs,
  ...
}: {
  imports = [flake.modules.home.tier-minTTY];

  home = {
    opts.tier.niceTTY.enabled = true;

    packages = with pkgs; [
      alejandra
      deadnix
      erdtree
      killall
      rm-improved
    ];
  };

  programs = {
    bat.enable = true;
    bottom.enable = true;
    fd.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };
}
