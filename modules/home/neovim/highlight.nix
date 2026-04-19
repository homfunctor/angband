# 'stylix-target-nixvim' overrides more stuff
{
  config,
  flake,
  ...
}:
flake.lib.reqHTier config "niceTTY" {
  programs.nixvim.highlightOverride = {
    inherit
      (config.home.opts.nvim.extraColors)
      Boolean
      Comment
      Keyword
      Number
      ;
    CmpDocumentation.bg = "none";
    CmpDocumentationBorder.bg = "none";
    CmpItemAbbr.bg = "none";
    CursorLineNr.bg = "none";
    DiagnosticHint.bg = "none";
    DiagnosticInfo.bg = "none";
    EndOfBuffer.bg = "none";
    FloatBorder.bg = "none";
    LineNr.bg = "none";
    Normal.bg = "none";
    NormalFloat.bg = "none";
    NotifyBackground.bg = "none";
    Pmenu.bg = "none";
    SignColumn.bg = "none";
    SnacksIndent.bg = "none";
    SnacksIndentScope.bg = "none";
    StatusLine.bg = "none";
    String.italic = true;
    TabLine.bg = "none";
    TreesitterContext.bg = "none";
    TroubleNormal.bg = "none";
    TroubleNormalNC.bg = "none";
    TSBoolean.link = "Boolean";
    TSComment.link = "Comment";
    TSKeyword.link = "Keyword";
    TSNumber.link = "Number";
    WhichKeyNormal.bg = "none";
    WinBar.bg = "none";
    WinBarNC.bg = "none";
  };
}
