{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
  ];

  # ── System ─────────────────────────────────────────────

  system.stateVersion = "26.05";

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  # ── Boot ───────────────────────────────────────────────

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # ── User ───────────────────────────────────────────────

  users.users.dani = {
    isNormalUser = true;
    description = "dani";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # ── Desktop ────────────────────────────────────────────

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    direnv.enable = true;
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
  };

  services.flatpak.enable = true;
  services.xserver.xkb.layout = "us";
}
