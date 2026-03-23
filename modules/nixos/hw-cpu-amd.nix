{config, ...}: {
  boot = {
    blacklistedKernelModules = ["k10temp"];
    extraModulePackages = [config.boot.kernelPackages.zenpower];
    kernelModules = ["zenpower"];
    kernelParams = ["amd_pstate=active"];
  };

  hardware.cpu.amd.updateMicrocode = true;
}
