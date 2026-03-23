{
  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "nvme"
      "rtsx_pci_sdmmc"
      "sd_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];

    kernelModules = ["uinput"];
  };
}
