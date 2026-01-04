#!/bin/bash

#  - Batch installer for essential CLI utilities:
#    - fzf: Fuzzy finder for command-line
#    - ripgrep: Fast text search (grep alternative)
#    - bat: Enhanced cat with syntax highlighting
#    - eza: Modern ls replacement with colors
#    - zoxide: Smart cd that learns your patterns
#    - plocate: Fast file locator
#    - apache2-utils: Utilities including ab benchmarking
#    - fd-find: Fast alternative to find
sudo apt install -y fzf ripgrep bat eza zoxide plocate apache2-utils fd-find
