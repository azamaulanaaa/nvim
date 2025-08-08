# neovim configuration

A minimalist Neovim configuration designed for simplicity and high compatibility across different systems.

# plugins used

- **[folke/lazy.nvim](https://github.com/folke/lazy.nvim)**: A modern plugin manager for Neovim.
- **[saghen/blink.cmp](https://github.com/saghen/blink.cmp)**: Enhanced UI and sources (path, buffer, etc.) for Neovim's autocompletion.
- **[stevearc/confirm.nvim](https://github.com/stevearc/confirm.nvim)**: A simple utility for creating confirmation popups.
- **[ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)**: A fuzzy search tool for files, lines, help tags, and more.
- **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git tooling and indicators for managing hunks.
- **[lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**: Increases readability by adding indentation guides.
- **[folke/lazydev.nvim](https://github.com/folke/lazydev.nvim)**: Provides type definitions and completion for Neovim's Lua API.
- **[ggandor/leap.nvim](https://github.com/ggandor/leap.nvim)**: A motion plugin to jump to any visible location in 2-3 keypresses.
  - **[tpope/vim-repeat](https://github.com/tpope/vim-repeat)**: A patch to allow repeating plugin actions with the `.` operator.
- **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Configurations for the Neovim Language Server Protocol (LSP) client.
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and feature-rich statusline.
- **[mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)**: An installation manager for LSPs, linters, and formatters.
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A feature-rich file explorer.
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: A powerful framework for syntax highlighting, indentation, and more.
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)**: A popup that displays available keybindings.

# file structure

This configuration uses a modular structure to keep settings organized and easy to update.

- `lua/core/`
  This directory contains all the foundational setup files, including plugin configurations, default options, and core keymaps. **It's recommended not to edit these files directly**, as changes may be overwritten by future updates.

- `lua/custom/`
  This is where you should place all your personal customizations. The `init.lua` is configured to automatically load any `.lua` files you place in this directory. This allows you to safely add your own plugins, override keymaps, or tweak settings without modifying the core files.

# branch

This repository uses two primary branches to separate the stable base configuration from my personal, day-to-day setup.

- **`main`**
  This is the **stable, foundational branch**. It is designed to be a solid, minimalist, and highly compatible starting point for anyone. You should fork or clone from this branch to build your own configuration. The philosophy of this branch is built on:
  - Minimalism
  - Consistency
  - Functionality
  - Compatibility

- **`personal`**
  This branch is my **personal daily driver**. It is built on top of `main` and contains all my opinionated tweaks and experimental plugins, primarily within the `lua/custom/` directory.

  ⚠️ **Use this branch as a reference only.** It serves as a real-world example of how to customize the `main` branch. Do not fork this branch directly, as its commit history is frequently rewritten (`git rebase`), which will break your own fork.
