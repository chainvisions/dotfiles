{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  
  # Networking.
  networking.hostName = "nixos";
  networking.networkManager.enable = true;

  # Time & Locale.
  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHOEN = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Program Options.
  programs.yazi.enable = true;
  programs.lazygit.enable = true;
  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.sway.enable = true;
  programs.thunderbird.enable = true;
  
  # Virtualization.
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # User Accounts.
  users.users.crab = {
    isNormalUser = true;
    description = "Crab";
    extraGroups = [ "networkManager", "wheel", "libvirtd" ];
    packages = with pkgs; [];
  };
  
  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  # System Packages.
  environment.systemPackages = with pkgs; [
    # OS & Desktop Related.
    pkgs.alacritty
    pkgs.ripgrep
    pkgs.rofi-wayland
    # Browsing, Social, Communication, etc.
    pkgs.brave
    pkgs.tor-browser
    pkgs.goofcord
    pkgs.keepassxc
    pkgs.flameshot
    pkgs.mullvad-vpn
    # Personal/Learning.
    pkgs.obsidian
    pkgs.anki
    # Crypto.
    pkgs.framesh
    # Dev Environment.
    pkgs.nodejs
    pkgs.pnpm
    pkgs.R
    pkgs.rustc
    pkgs.cargo
  ];
  
  # NixOS release version.
  system.stateVersion = "24.11";
}
