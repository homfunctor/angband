{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    app2unit
    xdg-terminal-exec
  ];

  programs.noctalia-shell.settings.appLauncher = {
    autoPasteClipboard = false;
    density = "compact";
    enableClipPreview = false;
    enableClipboardHistory = false;
    enableSettingsSearch = false;
    enableWindowsSearch = false;
    iconMode = "native";
    ignoreMouseInput = false;
    overviewLayer = true; # showAboveFullscreen
    position = "center";
    showCategories = true;
    showIconBackground = false;
    sortByMostUsed = false;
    terminalCommand = config.home.opts.apps.terminal.exe + " -e";
    useApp2Unit = true;
    viewMode = "grid";
  };
}
