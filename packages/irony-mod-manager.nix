{pkgs}: let
  inherit
    (pkgs)
    autoPatchelfHook
    copyDesktopItems
    fetchzip
    fontconfig
    icu
    jq
    lib
    libICE
    libSM
    libX11
    libgcc
    libxkbcommon
    lttng-ust_2_12
    makeDesktopItem
    makeWrapper
    openssl
    stdenv
    wayland
    zlib
    ;

  runtimeLibs = [
    icu
    libICE
    libSM
    libX11
    libxkbcommon
    openssl
    wayland
  ];
in
  stdenv.mkDerivation rec {
    pname = "irony-mod-manager";
    version = "1.27.149";

    src = fetchzip {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      sha256 = "sha256-seH+TRzkuIO8dHtT9djyMeK6dyZtmIRyErLai04Ks1w=";
      stripRoot = false;
    };

    nativeBuildInputs = [
      autoPatchelfHook
      copyDesktopItems
      makeWrapper
    ];

    buildInputs = [
      fontconfig.lib
      libgcc.lib
      lttng-ust_2_12
      zlib
    ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out $out/bin
      cp -r $src/* $out/
      mv $out/IronyModManager $out/.IronyModManager-wrapped
      chmod +x $out/.IronyModManager-wrapped

      # enable wayland support
      ${lib.getExe jq} '."LinuxOptions"."DisplayServer" = "auto"' \
      $out/appSettings.json > $out/tmp.json
      mv $out/tmp.json $out/appSettings.json

      makeWrapper $out/.IronyModManager-wrapped $out/bin/IronyModManager \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}"
      runHook postInstall
    '';

    desktopItems = [
      (makeDesktopItem {
        categories = ["Game"];
        comment = "Mod Manager for Paradox Games";
        desktopName = "Irony Mod Manager";
        exec = "IronyModManager";
        icon = "applications-games";
        name = "Irony Mod Manager";
      })
    ];

    meta = with lib; {
      changelog = "https://github.com/bcssov/IronyModManager/releases/tag/v${version}";
      description = "Mod Manager for Paradox Games";
      homepage = "https://github.com/bcssov/IronyModManager";
      maintainers = [];
      license = licenses.mit;
    };
  }
