{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.conform;
in
  lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      black
      clang-tools
      jq
      prettierd
      shfmt
      sql-formatter
      sqls
      sqruff
      stylua
      xmlformat
      yamlfmt
    ];

    programs.nixvim.plugins.conform-nvim = {
      enable = true;

      settings = {
        default_format_opts.lsp_format = "fallback";

        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };

        formatters.clang_format.args = [
          "--style={SortIncludes: false}"
        ];

        formatters_by_ft = {
          "_" = [
            "squeeze_blanks"
            "trim_newlines"
            "trim_whitespace"
          ];
          bash = ["shfmt"];
          c = ["clang_format"];
          cpp = ["clang_format"];
          fish = ["fish_indent"];
          json = ["jq"];
          lua = ["stylua"];
          markdown = ["prettierd" "prettier"];
          nix = ["alejandra"];
          python = ["black"];
          rust = ["rustfmt"];
          sh = ["shfmt"];
          sql = ["sql_formatter"];
          xml = ["xmlformat"];
          yaml = ["yamlfmt"];
        };

        notify_on_error = true;
      };
    };
  }
