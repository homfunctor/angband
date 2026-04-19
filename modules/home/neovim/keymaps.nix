{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "niceTTY" {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalLeader = " ";
    };

    keymaps = [
      {
        action = ":sort<ESC>";
        key = "<A-s>";
        mode = "v";
      }

      {
        action = "<cmd>nohl<CR>";
        key = "<esc>";
        mode = "n";
        options.desc = "Clear search";
      }

      {
        action = "<cmd>w<cr><esc>";
        key = "<C-s>";
        mode = "n";
        options = {
          desc = "Save file";
          silent = true;
        };
      }

      {
        action = "<cmd>q<cr><esc>";
        key = "<C-q>";
        mode = "n";
        options = {
          desc = "Exit file";
          silent = true;
        };
      }

      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
        options = {
          desc = "Move down when line is highlighted";
          silent = true;
        };
      }

      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
        options = {
          desc = "Move up when line is highlighted";
          silent = true;
        };
      }

      {
        action = "<gv";
        key = "<";
        mode = "v";
        options = {
          desc = "Indent while remaining in visual mode.";
          silent = true;
        };
      }

      {
        action = ">gv";
        key = ">";
        mode = "v";
        options = {
          desc = "Indent while remaining in visual mode.";
          silent = true;
        };
      }
    ];
  };
}
