{inputs, ...}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs = {
    neovide.enable = true;
    nixvim.enable = true;
  };
}
