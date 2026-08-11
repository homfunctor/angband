# imported by hosts/<host>/settings/hardware.nix
{
  config,
  flake,
  lib,
  pkgs,
  ...
}:
flake.lib.reqNTier config "personal" {
  boot = {
    kernelModules = ["amdgpu"];
    kernelParams = [
      "amdgpu.gpu_recovery=1"
      "amdgpu.ppfeaturemask=0xffff7fff"
    ];
  };
  environment.systemPackages = [pkgs.lact];

  hardware = {
    amdgpu.initrd.enable = true;
    graphics.extraPackages = with pkgs; [
      vulkan-extension-layer
      vulkan-loader
      vulkan-tools
      # vulkan-validation-layers
    ];
  };

  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
      wantedBy = ["multi-user.target"];
    };
  };
}
