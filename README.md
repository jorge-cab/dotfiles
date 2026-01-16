# Dotfiles

Personal dotfiles managed with GNU Stow, organized for cross-platform deployment (Linux/macOS).

## Quick Setup

### Linux
```bash
cd ~/dotfiles
stow common linux
```

### macOS
```bash
cd ~/dotfiles
stow common mac
```

## Structure

- `common/` - Shared configurations (Neovim, Tmux, Ranger)
- `linux/` - Linux-specific configs (Hyprland, Kitty, Waybar, Zsh)
- `mac/` - macOS-specific configs (Zsh)

## Uninstall

```bash
stow -D common linux  # or mac
```
