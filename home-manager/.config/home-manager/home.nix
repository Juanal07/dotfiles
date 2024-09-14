# home.nix
# home-manager switch
# home-manager generations
{ config, pkgs, ... }:

{
  # home.username = "jraya";
  # home.homeDirectory = "/Users/jraya";
  home.username = "juan";
  home.homeDirectory = "/home/juan";

  home.stateVersion = "24.05";

  home.packages = [
    # pkgs.kitty
    # pkgs.alacritty
    pkgs.scc
    pkgs.ncdu
    pkgs.delta
    pkgs.ripgrep
    pkgs.fd
    pkgs.sd
    pkgs.tree
    pkgs.atuin
    pkgs.stow
    pkgs.lf
    pkgs.mpv
    pkgs.neofetch
    pkgs.vim
    pkgs.tree

    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/juan/dotfiles/nvim;
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink /home/juan/dotfiles/kitty;
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink /home/juan/dotfiles/lf;
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink /home/juan/dotfiles/git/.gitconfig;
    # ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink /home/juan/dotfiles/git-mac/.gitconfig;
    ".config/ncdu/config".text = ''
      --color dark
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jraya/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  programs = {
    home-manager.enable = true;
    neovim.enable = true;
    htop.enable = true;
    eza.enable = true;
    bat.enable = true;
    fzf.enable = true;
    jq.enable = true;
    git.enable = true;
  };
}
