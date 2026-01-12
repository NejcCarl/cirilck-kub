#!/bin/bash

#This script installs a comprehensive development environment with various tools and libraries. Here's what each package does:
#
#Development Tools & Compilers:
#
#build-essential - Essential compilation tools (gcc, make, etc.) for building software from source
#pkg-config - Manages library compilation and linking flags
#autoconf - Automatically configures source code packages for compilation
#bison - Parser generator for creating parsers from grammar files
#pipx - Installs Python applications in isolated environments
#Core Development Libraries:
#
#libssl-dev - OpenSSL library headers for encryption/HTTPS support
#zlib1g-dev - Data compression library headers
#libyaml-dev - YAML file parsing library headers
#libncurses5-dev - Terminal user interface library headers
#libffi-dev - Foreign Function Interface library for calling C code from other languages
#libgdbm-dev - GNU database manager library headers
#libjemalloc2 - High-performance memory allocator
#Image Processing:
#
#libvips - Fast image processing library
#imagemagick - Comprehensive image manipulation toolkit
#libmagickwand-dev - ImageMagick development headers
#mupdf - Lightweight PDF viewer and toolkit
#mupdf-tools - Command-line PDF manipulation utilities

sudo apt install -y \
  build-essential pkg-config autoconf bison pipx \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips imagemagick libmagickwand-dev mupdf mupdf-tools
