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
            $git_branch$git_status[](bg:${colors.base07} ''
          + ''
            fg:${colors.base04})$nix_shell[](bg:${colors.base08} ''
          + ''
            fg:${colors.base00})$character
          '';

        character = {
          error_symbol = "[](bold ${colors.base03})";
          success_symbol = "[](bold ${colors.base05})";
        };

        directory = {
          format = "[ $path ]($style)";
          read_only = " [󰌾](${colors.base04})";
          style = "fg:${colors.base00} bg:${colors.base05}";
        };

        git_branch = {
          format = "[ $symbol$branch ]($style)";
          style = "fg:${colors.base08} bg:${colors.base03}";
          symbol = " ";
        };

        git_status = {
          ahead = "↑";
          behind = "↓";
          deleted = "✘";
          diverged = "↕";
          format = "([$all_status$ahead_behind]($style))";
          renamed = "→";
          style = "fg:${colors.base05}";
        };

        nix_shell = {
          format = "[ $symbol$state ]($style)";
          style = "fg:${colors.base07} bg:${colors.base04}";
          symbol = " ";
        };
      };
    };
  }
