# imported by hosts/<host>/users/<user>/settings/core.nix
# todo: change time format, and other stuff
{
  config,
  flake,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in
  flake.lib.reqHTier config "work" {
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;
        right_format = "$time";
        time.disabled = false;

        format =
          ''
            [](bg:${colors.base05} ''
          + ''
            fg:${colors.base00})$directory$read_only[]''
          + ''(bg:${colors.base06} fg:${colors.base00})''
          + ''
            $git_branch$git_status[](bg:${colors.base02} ''
          + ''
            fg:${colors.base01})$ssh_symbol$hostname$nix_shell[](bg:${colors.base08} ''
          + ''
            fg:${colors.base00})$character
          '';

        directory = {
          format = "[ $path ]($style)";
          style = "fg:${colors.base00} bg:${colors.base05}";
        };

        hostname = {
          disabled = false;
          ssh_only = true;
          ssh_symbol = "󱕙 ";
          format = "[ ssh@$hostname ]($style)";
          style = "fg:${colors.base01} bg:${colors.base08}";
        };
      };
    };
  }
