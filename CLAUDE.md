# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Omakub is an opinionated Ubuntu 24.04+ setup system that transforms a fresh installation into a fully-configured web development environment.
It's a bash-based installer that automates the setup of terminal tools, desktop applications, themes, and development environments.

## Architecture

### Installation System

The installation follows a multi-stage pipeline:

1. **boot.sh** - Entry point that clones the repository to `~/.local/share/cirilck-kub` and kicks off the installation
2. **install.sh** - Main orchestrator that:
   - Checks Ubuntu version compatibility (install/check-version.sh)
   - Prompts for user choices via `gum` (install/first-run-choices.sh)
   - Runs terminal installers (install/terminal.sh)
   - Conditionally runs desktop installers if GNOME is detected (install/desktop.sh)

### Script Organization

- **install/terminal/*.sh** - Terminal tools (Docker, Neovim, Zellij, LazyGit, etc.)
- **install/desktop/*.sh** - Desktop apps and GNOME configuration
- **install/desktop/optional/*.sh** - Optional applications (Brave, Discord, Steam, etc.)
- **defaults/bash/** - Bash configuration files (aliases, functions, prompt, rc)
- **configs/** - Configuration files for installed tools (Alacritty, Neovim, Zellij, btop)
- **themes/** - Color themes for various applications (Tokyo Night, Catppuccin, Nord, etc.)
- **applications/*.sh** - Desktop entry generators for web apps and tools
- **migrations/** - Timestamped migration scripts for updates
- **bin/omakub** - Post-install management CLI

### Key Patterns

**Modular Installers**: Each installer script is self-contained and can be sourced independently. Desktop and terminal installers are run via loops:
```bash
for installer in ~/.local/share/cirilck-kub/install/terminal/*.sh; do source $installer; done
```

**User Choices**: The system uses `gum` for interactive prompts. Choices are stored in environment variables (e.g., `OMAKUB_FIRST_RUN_LANGUAGES`, `OMAKUB_FIRST_RUN_DBS`) and can be automated by pre-setting these variables.

**Theme System**: Themes are centralized in themes/ with subdirectories per theme. Each theme contains configs for:
- Alacritty (terminal colors)
- Zellij (terminal multiplexer)
- Neovim (editor)
- btop (system monitor)
- GNOME (desktop environment)
- VS Code (via gnome.sh and vscode.sh scripts)

**Web Apps as Desktop Entries**: The applications/ directory contains scripts that generate .desktop files for web-based tools (WhatsApp, etc.), integrating them into the GNOME launcher.

### Post-Install Management

The `omakub` command (bin/omakub) provides a gum-based menu for:
- **Theme**: Switch between color themes across all tools
- **Font**: Change terminal and editor fonts
- **Update**: Update manually-managed apps (Neovim, LazyGit, LazyDocker, Zellij, Ollama)
- **Install**: Add optional apps and development tools post-installation
- **Uninstall**: Remove Omakub
- **Manual**: Link to documentation

### Development Environment Setup

**Programming Languages**: Managed via `mise` (formerly rtx). Languages are installed through install/terminal/select-dev-language.sh and include Ruby on Rails, Node.js, Go, PHP, Python, Elixir, Rust, and Java.

**Databases**: Run as Docker containers with restart policies. Configured in install/terminal/select-dev-storage.sh for MySQL, Redis, and PostgreSQL on localhost ports.

**Docker**: Installed from official Docker repo with user added to docker group (install/terminal/docker.sh). Default logging is configured to prevent disk fill.

## Common Commands

### Testing Installation Scripts
Since this is an installer for Ubuntu systems, there's no traditional test suite. To test changes:
- Use a fresh Ubuntu 24.04+ VM or container
- Run: `bash <(curl -fsSL https://raw.githubusercontent.com/yourusername/omakub/yourbranch/boot.sh)`
- Or for local testing, modify boot.sh to clone from your local repository

### Working with Themes
To add or modify a theme, create/edit:
- `themes/<theme-name>/alacritty.toml`
- `themes/<theme-name>/zellij.kdl`
- `themes/<theme-name>/neovim.lua`
- `themes/<theme-name>/btop.theme` (optional)
- `themes/<theme-name>/gnome.sh`
- `themes/<theme-name>/tophat.sh`
- `themes/<theme-name>/vscode.sh`

Update THEME_NAMES array in bin/omakub-sub/theme.sh to include the new theme.

### Adding Optional Applications
1. Create `install/desktop/optional/app-<name>.sh` for desktop apps or `install/terminal/optional/app-<name>.sh` for CLI tools
2. Add entry to CHOICES array in bin/omakub-sub/install.sh
3. Follow existing patterns for .deb packages, flatpak, snap, or manual installations

### Migrations
When updating Omakub itself, create timestamped migration scripts in migrations/ directory. These are run via bin/omakub-sub/migrate.sh.

## Important Notes

- **Target OS**: Ubuntu 24.04+ only. The install/check-version.sh enforces this.
- **GNOME Detection**: Desktop features only install when `XDG_CURRENT_DESKTOP` contains "GNOME"
- **Error Handling**: Main install.sh uses `set -e` and traps ERR to provide retry instructions
- **User Paths**: Everything installs to user directories (`~/.local/share/cirilck-kub`, `~/.config/`, etc.) to avoid requiring excessive sudo
- **Aliases**: Common aliases are defined in defaults/bash/aliases (e.g., `ls` → `eza`, `cd` → `z`, `n` → `nvim`, `lzg` → `lazygit`)
