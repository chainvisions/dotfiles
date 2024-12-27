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

  # Program Options.
  programs.yazi.enable = true;
  programs.lazygit.enable = true;
  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.sway.enable = true;
  programs.thunderbird.enable = true;
  
  # User Accounts.
  users.users.crab = {
    isNormalUser = true;
    description = "Crab";
    extraGroups = [ "networkManager", "wheel" ];
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
