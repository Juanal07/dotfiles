{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              end = "-8G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };
          };
        };
      };
    };
  };
}

# sudo systemctl start wpa_supplicant
# wpa_cli
# add_network
# set_network 0 ssid "myhomenetwork"
# set_network 0 psk "mypassword"
# set_network 0 key_mgmt WPA-PSK
# enable_network 0

# curl -L -o disko-config.nix raw.githubusercontent.com/Juanal07/dotfiles/master/disko-config.nix
# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko-config.nix
