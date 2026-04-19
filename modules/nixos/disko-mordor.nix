# imported by hosts/mordor/settings/disko.nix
# this file is consumed by disko during installation of NixOS
# and so should not import anything nor be passed anything
# details:
#   /root on NVMe SSD, and swap
#   media files on HDD mounted at /vault
#   all are LUKS encrypted
{
  disko.devices = {
    # /root on NVMe SSD, and swap
    disk = {
      main = {
        device = "/dev/nvme0n1";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";

              content = {
                format = "vfat";
                mountOptions = ["fmask=0007" "umask=0077"];
                mountpoint = "/boot";
                type = "filesystem";
              };
            };

            luks = {
              size = "100%";

              content = {
                name = "obscured";
                settings.allowDiscards = true;
                type = "luks";

                content = {
                  type = "lvm_pv";
                  vg = "mainpool";
                };
              };
            };
          };
        };
      };

      # media files on HDD mounted at /vault
      media = {
        device = "/dev/sda";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            luks = {
              size = "100%";

              content = {
                name = "vault";
                settings.allowDiscards = true;
                type = "luks";

                content = {
                  type = "lvm_pv";
                  vg = "mediapool";
                };
              };
            };
          };
        };
      };
    };

    # LUKS encryption
    lvm_vg = {
      mainpool = {
        type = "lvm_vg";

        lvs = {
          encryptedSwap = {
            size = "36G";

            content = {
              priority = 100;
              randomEncryption = true;
              type = "swap";
            };
          };

          root = {
            size = "100%FREE";

            content = {
              format = "ext4";
              mountOptions = ["defaults"];
              mountpoint = "/";
              type = "filesystem";
            };
          };
        };
      };

      mediapool = {
        type = "lvm_vg";

        lvs = {
          media = {
            size = "100%FREE";

            content = {
              format = "ext4";
              mountOptions = ["defaults"];
              mountpoint = "/vault";
              type = "filesystem";
            };
          };
        };
      };
    };
  };
}
