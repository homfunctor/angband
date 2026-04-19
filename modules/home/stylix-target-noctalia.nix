# imported by hosts/<host>/users/<user>/settings/stylix.nix
{
  config,
  lib,
  osConfig,
  ...
}: let
  enabled =
    config.home.opts.gui.noctalia.enabled
    && config.home.opts.tier.work.enabled
    && osConfig.nixos.opts.stylix.enabled;
in
  lib.mkIf enabled {
    # i prefer a different style than stylix uses
    home.opts.stylix.targets.noctalia-shell.enable = lib.mkForce false;

    programs.noctalia-shell = {
      colors = with config.lib.stylix.colors.withHashtag; {
        mError = base08;
        mHover = base0C;
        mOnError = base00;
        mOnHover = base00;
        mOnPrimary = base00;
        mOnSecondary = base00;
        mOnSurface = base08;
        mOnSurfaceVariant = base07;
        mOnTertiary = base00;
        mOutline = base00;
        mPrimary = base0E;
        mSecondary = base0E;
        mShadow = base00;
        mSurface = base01;
        mSurfaceVariant = base00;
        mTertiary = base0C;
      };

      settings.bar = with config.stylix; {
        backgroundOpacity = opacity.desktop;
        capsuleOpacity = opacity.desktop;
      };
    };
  }
