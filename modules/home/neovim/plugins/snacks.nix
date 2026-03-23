{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.snacks;
in {
  programs.nixvim.plugins.snacks = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      animate.enabled = true;
      bigfile.enabled = true;

      indent = {
        enabled = true;
        chunk = {
          enabled = true;
          char = {
            arrow = "─";
            corner_bottom = "└";
            corner_top = "┌";
          };
          hl = "SnacksIndentScope";
          only_current = true;
        };
      };

      input.enabled = true;
      layout.enabled = true;

      notifier = {
        enabled = true;
        style = "minimal";
        top_down = false;
      };

      notify.enabled = true;

      picker.enabled = true;
      quickfile.enabled = true;

      scope.enabled = true;

      statuscolumn.enabled = true;
      styles.notification.wo.wrap = true;

      toggle.enabled = true;

      win.backdrop.blend = 50;

      words.enabled = true;
    };
  };
}
