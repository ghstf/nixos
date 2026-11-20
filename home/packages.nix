{ pkgs, proton-cli, ... }:

{
  home.packages = with pkgs; [
    # Shell
    ghostty
    starship

    # Development
    crush
    delta
    devenv
    gcc
    gh
    git
    jujutsu
    lazygit
    neovim
    tokei
    tree-sitter

    # Utilities
    bat
    bottom
    eza
    fd
    fzf
    gnupg
    ripgrep
    zoxide

    # Wayland
    fuzzel
    grim
    rofimoji
    rose-pine-cursor
    rose-pine-hyprcursor
    wl-clipboard

    # Applications
    mpv
    obsidian
    rainfrog

    proton-cli.packages.${pkgs.system}.default
  ];
}
