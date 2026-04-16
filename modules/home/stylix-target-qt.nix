# imported by hosts/<host>/users/<user>/settings/stylix.nix
#
# https://github.com/nix-community/stylix/blob/master/modules/qt/hm.nix
# Added the following to kvconfig.mustache:
# [General]
# composite=false
# rounded_menu=false
# menu_combo_button=false
# rounded_dialogs=false
#
# [Layout]
# layout_spacing=2
# layout_margin=2
# submenu_overlap=0
#
# [Metrics]
# radius=0
#
# [Compositing]
# shadow_size=0
# popup_menu_blurring=false
#
# [Hacks]
# transient_scrollbar=true
# inline_toolbar_icon=false
# no_window_pattern=true
# does it work? no idea.
{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  enabled =
    osConfig.nixos.opts.stylix.enable
    && osConfig.nixos.opts.tier.work.enabled;
in
  lib.mkIf enabled
  {
    qt = {
      enable = true;
      platformTheme.name = lib.mkForce "kvantum";
    };

    home = {
      opts.stylix.targets.qt.enable = true;

      packages = let
        inherit (builtins) unsafeDiscardStringContext;
        inherit (osConfig.lib.stylix) colors;

        svg = colors {
          extension = "svg";
          template =
            /.
            + unsafeDiscardStringContext
            "${inputs.utumno}/assets/kvantum-svg.mustache";
        };

        kvconfig = colors {
          extension = ".kvconfig";
          template =
            /.
            + unsafeDiscardStringContext
            "${inputs.utumno}/assets/kvconfig.mustache";
        };

        kvantumPackage = pkgs.runCommandLocal "base16-kvantum" {} ''
          directory="$out/share/Kvantum/Base16Kvantum"
          mkdir --parents "$directory"
          cat ${kvconfig} >>"$directory/Base16Kvantum.kvconfig"
          cat ${svg} >>"$directory/Base16Kvantum.svg"
        '';
      in [kvantumPackage];
    };

    xdg.configFile = let
      inherit (builtins) unsafeDiscardStringContext;
      inherit (osConfig.lib.stylix) colors;
      inherit (osConfig.stylix) fonts;

      fixedFonts =
        "${fonts.monospace.name},"
        + toString fonts.sizes.terminal;

      generalFonts =
        "${fonts.sansSerif.name},"
        + toString fonts.sizes.applications;

      qtctConfig = ''
        [Appearance]
        style=kvantum-dark
        icon_theme=${osConfig.nixos.opts.stylix.iconTheme.name}
        custom_palette=true
        [Fonts]
        fixed="${fixedFonts}"
        general="${generalFonts}"
      '';

      svg = colors {
        extension = "svg";
        template = /. + unsafeDiscardStringContext "${inputs.utumno}/assets/kvantum-svg.mustache";
      };

      kvconfig = colors {
        extension = ".kvconfig";
        template = /. + unsafeDiscardStringContext "${inputs.utumno}/assets/kvconfig.mustache";
      };

      kvantumPackage = pkgs.runCommandLocal "base16-kvantum" {} ''
        directory="$out/share/Kvantum/Base16Kvantum"
        mkdir --parents "$directory"
        cat ${kvconfig} >>"$directory/Base16Kvantum.kvconfig"
        cat ${svg} >>"$directory/Base16Kvantum.svg"
      '';
    in {
      "Kvantum/Base16Kvantum".source = "${kvantumPackage}/share/Kvantum/Base16Kvantum";

      "Kvantum/kvantum.kvconfig".source =
        (pkgs.formats.ini {}).generate
        "kvantum.kvconfig" {
          General.theme = "Base16Kvantum";
        };

      "qt5ct/qt5ct.conf".text = qtctConfig;

      "qt6ct/qt6ct.conf".text = qtctConfig;
    };
  }
