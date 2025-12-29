

# Codekub Project Overview

**Codekub** is a collection of scripts that automatically configure a Linux desktop environment (primarily **GNOME-based**) with:

* Themes, wallpapers, fonts, and icons
* Desktop customization and startup applications
* Terminal and shell setup (Zsh, Oh My Zsh, Powerlevel10k)
* Programming languages, tools, and development environment

The goal is to create a **ready-to-use, beginner-friendly Linux environment** while also being **extensible for developers**.

---

## Step 1: `boot.sh`

```bash
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/main/boot.sh | bash
```

**Purpose:**

* Downloads and executes `boot.sh` from GitHub
* Prepares the system for installation
* Downloads `install.sh` and other required resources
* Starts the installation/configuration process

**Developer Notes:**

* `boot.sh` should **always use the `main` branch** for default installations.
* Using a development branch (`dev`) is for testing only; changes there will not appear for normal users.

---

## Step 2: `install.sh`

**Purpose:**

* Main installer script
* Clones source files and prepares Codekub environment
* Installs tools, themes, and desktop configurations

**What it does:**

1. Installs essential CLI tools like `gum` for interactive prompts
2. Detects system environment and dependencies (live session vs installed OS, user detection, etc.)
3. Offers optional configurations for desktop, terminal, and development tools

**Important Notes:**

* Signal is now optional
* Snap packages like `ghostty` require `sudo`:

  ```bash
  sudo snap install ghostty --classic
  ```
* Reboot logic from `gum` is moved to Zsh configuration
* Zsh setup installs **Antigen**; the terminal setup will fail if it’s missing

---

## Step 3: Desktop Configuration

Once the scripts finish, Codekub configures the desktop:

### Theme & Wallpaper

* Default theme: **Tokyo Night**
* Wallpapers are located in the `theme/` folder

### Desktop & Dock

* The `desktop/` folder contains configuration files for:

  * Desktop icons
  * Dock favorites
  * Startup applications
* Also includes GNOME settings for:

  * Extensions
  * Hotkeys
  * Themes

**Optional Installation via Codekub App:**

* Users can install/uninstall apps and adjust settings from the Codekub GUI

---

## Folder Structure Overview

| Folder / File   | Purpose                                                                           |
| --------------- | --------------------------------------------------------------------------------- |
| `boot.sh`       | Entry point; prepares the system                                                  |
| `install.sh`    | Main installer; clones repo and installs tools/configs                            |
| `applications/` | Contains `.desktop` files for installed apps (icons, images, etc.)                |
| `bin/`          | Scripts for app management (install, uninstall, quit, font setup)                 |
| `config/`       | Stores preferences and configuration for installed tools                          |
| `default/`      | Default aliases, emoji sets, and other base configurations                        |
| `desktop/`      | Sets up app launchers, dock favorites, and GNOME settings                         |
| `terminal/`     | Installs terminal apps, programming languages, compilers, and dev tools           |
| `theme/`        | Contains VS Code, Neovim, btop, Zellij, Powerlevel10k themes, and other UI themes |
| `uninstall/`    | Scripts to uninstall apps and remove configurations                               |

---

## Terminal & Development Setup

* Installs development tools and languages
* Sets up Git, compilers, and programming environment
* Provides a curated terminal experience with Zsh + Oh My Zsh + Powerlevel10k

---

## Themes & Customization

* Multiple themes for editor, terminal, and desktop environment
* VS Code background, Neovim, btop, Zellij, and top-hat themes included
* Users can switch themes via the Codekub app



the main problem is the boot when using dev branch for checking downlaod the main branch we will losoe so mathc time we realixe itis donwload main branch a

the ascii cannot have ' otherwise it will bash eroror 
make sure the "" are all closed and stuff 