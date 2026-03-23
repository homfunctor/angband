{pkgs}: let
  inherit
    (pkgs)
    adwaita-icon-theme
    buildDotnetModule
    copyDesktopItems
    dotnetCorePackages
    fetchFromGitLab
    gtk3
    gtk4
    gtksourceview4
    lib
    makeDesktopItem
    wrapGAppsHook3
    ;
in
  buildDotnetModule rec {
    pname = "apotheosis";
    version = "2025-04-10";

    src = fetchFromGitLab {
      hash = "sha256-/d3/zraFLQkNlFAV6gNduPEz2/LAsDKQsjnP58oEaII=";
      owner = "noqn";
      repo = "apotheosis";
      rev = "b878e90d558d702afefb8be3bd9fa933ee950fb4";
    };

    dotnet-runtime = dotnetCorePackages.runtime_9_0;
    dotnet-sdk = dotnetCorePackages.sdk_9_0;
    nugetDeps = ./deps.json;

    projectFile = "Gui/Gui.csproj";

    buildInputs = [
      adwaita-icon-theme
      gtk3
      gtk4
      gtksourceview4
    ];
    nativeBuildInputs = [
      copyDesktopItems
      wrapGAppsHook3
    ];
    runtimeDeps = buildInputs;

    # i have x11 setup as backup, but it still panics without setting this
    gappsWrapperArgs = [
      "--set GDK_BACKEND x11"
      "--set SDL_VIDEODRIVER x11"
    ];

    desktopItems = [
      (
        makeDesktopItem {
          categories = ["Game" "Utility"];
          comment = "GUI Mod Editor for Pillars of Eternity II: Deadfire";
          desktopName = "Apotheosis";
          exec = "Apotheosis";
          icon = "applications-games";
          name = "apotheosis";
          type = "Application";
        }
      )
    ];

    meta = {
      description = "";
      homepage = "https://gitlab.com/noqn/apotheosis";
      license = lib.licenses.agpl3Only;
      mainProgram = "Apotheosis";
      platforms = lib.platforms.all;
    };
  }
