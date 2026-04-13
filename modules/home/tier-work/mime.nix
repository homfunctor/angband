{
  config,
  lib,
  ...
}: let
  appsToGet = [
    "archive"
    "audio"
    "browser"
    "directory"
    "image"
    "officeCalc"
    "officeImpress"
    "officeWriter"
    "pdf"
    "terminal"
    "text"
    "video"
  ];

  # get the desktop names from opts.apps
  defaultApps = lib.genAttrs appsToGet (
    app: [(config.home.opts.apps.${app}.desktop + ".desktop")]
  );

  mimeMap = {
    archive = [
      "application/*tar"
      "application/7z"
      "application/rar"
      "application/zip"
    ];
    audio = [
      "audio/aac"
      "audio/mpeg"
      "audio/ogg"
      "audio/opus"
      "audio/wav"
      "audio/webm"
      "audio/x-matroska"
    ];
    browser = [
      "text/html"
      "x-scheme-handler/about"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/unknown"
    ];
    directory = ["inode/directory"];
    image = [
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/jpg"
      "image/png"
      "image/svg+xml"
      "image/tiff"
      "image/vnd.microsoft.icon"
      "image/webp"
    ];
    officeCalc = [
      "application/vnd.ms-excel"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    ];
    officeImpress = [
      "application/vnd.ms-powerpoint"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    ];
    officeWriter = [
      "application/msword"
      "application/rtf"
      "application/vnd.oasis.opendocument.text"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    ];
    pdf = ["application/pdf"];
    terminal = ["x-terminal-emulator"];
    text = ["text/plain"];
    video = [
      "video/mp2t"
      "video/mp4"
      "video/mpeg"
      "video/ogg"
      "video/webm"
      "video/x-flv"
      "video/x-matroska"
      "video/x-msvideo"
    ];
  };

  # magick
  associations = builtins.listToAttrs (
    lib.flatten (
      lib.mapAttrsToList (
        key: value:
          map (type: lib.nameValuePair type defaultApps.${key}) value
      )
      mimeMap
    )
  );
in {
  xdg.mimeApps = {
    enable = true;
    associations.added = associations;
    defaultApplications = associations;
  };
}
