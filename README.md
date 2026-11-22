# ghost

**NixOS configuration for a machine named ghost.**

Flake-based setup with Home Manager. One command rebuilds the full system,
user environment, and dotfiles together.

## → New machine

Boot a NixOS installer, partition, and mount your drives. Then:

```sh
nixos-install --flake github:ghstf/nixos#ghost
```

After rebooting, clone this repo and point future rebuilds at the local copy:

```sh
git clone https://github.com/ghstf/nixos ~/nixos
```

Restore secrets that live outside the store:

```sh
# WireGuard
sudo cp proton.conf /etc/wireguard/proton.conf
sudo chmod 600 /etc/wireguard/proton.conf

# Fish secrets
mkdir -p ~/.config/fish/secrets
echo "set -gx OPENROUTER_API_KEY your-key-here" > ~/.config/fish/secrets/openrouter.fish
```

Install [LazyVim](https://lazyvim.org) so nvim has its boilerplate in place.

```sh
git clone https://github.com/LazyVim/starter /tmp/lv
cp -rn /tmp/lv/. ~/.config/nvim/
rm -rf /tmp/lv ~/.config/nvim/.git
```

## → Rebuild

```sh
sudo nixos-rebuild switch --flake ~/nixos#ghost
```
