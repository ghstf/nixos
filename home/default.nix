{ pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  home = {
    username = "dani";
    homeDirectory = "/home/dani";
    stateVersion = "26.05";
  };

  # ── Dotfiles ───────────────────────────────────────────

  home.file = {
    ".config/fish/config.fish".source = ../dotfiles/fish/config.fish;

    ".config/ghostty/config".source = ../dotfiles/ghostty/config;

    ".config/hypr/hyprland.lua".source = ../dotfiles/hypr/hyprland.lua;

    ".config/fuzzel/fuzzel.ini".source = ../dotfiles/fuzzel/fuzzel.ini;

    ".config/nvim/lua/config/keymaps.lua".source = ../dotfiles/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/plugins/added.lua".source = ../dotfiles/nvim/lua/plugins/added.lua;
    ".config/nvim/lua/plugins/colors.lua".source = ../dotfiles/nvim/lua/plugins/colors.lua;
  };
}
