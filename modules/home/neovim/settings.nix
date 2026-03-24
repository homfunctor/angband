# todo: revise
{pkgs, ...}: {
  programs.nixvim = {
    defaultEditor = true;
    viAlias = true;
    vimdiffAlias = true;

    clipboard = {
      register = "unnamedplus";

      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard-rs;
        };
      };
    };

    colorschemes.base16.enable = true;

    diagnostic.settings.config = {
      float = {
        border = "single";
        focusable = false;
        source = "always";
      };
      jump.severity.__raw = "vim.diagnostic.severity.WARN";
      severity_sort = true;
      signs = true;
      underline = true;
      update_in_insert = true;
      virtual_text = false;
    };

    globals.floating_window_options.border = "single";

    opts = {
      # relative line numbers
      number = true;
      relativenumber = true;

      # 2 space tabs
      expandtab = true;
      showtabline = 0;
      softtabstop = 2;
      tabstop = 2;

      # auto-indent with spaces
      shiftwidth = 2;
      smartindent = true;

      # incremental searching
      hlsearch = true;
      incsearch = true;

      # text stuff
      breakindent = true;
      formatoptions = "cql";
      linebreak = true;
      showbreak = "↳ ";
      spell = true;
      spelllang = ["en_us"];
      whichwrap = "h,l,<,>,[,]";
      wrap = true;

      # split below and right
      splitbelow = true;
      splitright = true;

      # mouse mode
      mouse = "a";

      # ignorecase and smartcase for searching
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      smartcase = true;

      # faster completion
      updatetime = 50;

      # completion settings
      completeopt = [
        "menuone"
        "noinsert"
        "noselect"
      ];

      # persistent undo
      autoread = true;
      backup = false;
      swapfile = false;
      undofile = true;

      # colors
      termguicolors = true;

      # aesthetics
      cmdheight = 1;
      cursorline = false;
      cursorlineopt = "number";
      foldcolumn = "1";
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = -1;
      foldmethod = "indent";
      # pumblend = 100;
      pumheight = 10;
      ruler = false;
      scrolloff = 8;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      # winblend = 100;

      # which-key timeout
      timeoutlen = 10;

      # encoding
      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = ["text" "markdown"];
        command = "setlocal formatoptions-=t formatoptions-=n textwidth=0";
      }

      {
        event = "TextYankPost";
        pattern = "*";
        command = "lua vim.highlight.on_yank{timeout=500}";
      }
    ];

    performance.byteCompileLua = {
      enable = true;
      configs = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
