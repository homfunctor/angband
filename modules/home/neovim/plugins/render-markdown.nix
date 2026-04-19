{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.render-markdown;
in
  lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      marksman
      python312Packages.pylatexenc
    ];

    programs.nixvim = {
      plugins.render-markdown.enable = true;

      autoCmd = [
        {
          event = ["FileType"];
          pattern = ["markdown"];
          command = "setlocal wrap linebreak";
        }
        {
          event = ["FileType"];
          pattern = ["markdown"];
          command = "setlocal conceallevel=2";
        }
      ];
    };
  }
