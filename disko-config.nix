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
              name = "ESP";
              start = "2MiB";
              end = "1GiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              name = "swap";
              start = "1GiB";
              end = "9GiB";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };
            root = {
              name = "root";
              start = "9GiB";
              end = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
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

# curl -L -o https://raw.githubusercontent.com/Juanal07/dotfiles/master/disko-config.nix
# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko-config.nix
