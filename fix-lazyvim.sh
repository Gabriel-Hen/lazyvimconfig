#!/usr/bin/env bash
set -euo pipefail

echo "=== Atualizando sistema e instalando dependências ==="
sudo apt update && sudo apt upgrade -y

# ---------- Linguagens / Runtimes ----------
sudo apt install -y \
    golang-go \
    cargo \
    ruby-full \
    default-jdk \
    php8.1 \
    composer \
    nodejs npm \
    tree-sitter-cli \
    luarocks \
    fish \
    markdown \
    imagemagick \
    python3-pynvim \
    pipx

sudo update-alternatives --set php /usr/bin/php8.1 || true

sudo snap install \
    mermaid-cli \
    tectonic

# ---------- Ferramentas de formatação ----------
npm i -g \
    prettier \
    prettier-plugin-toml \
    @fsouza/prettierd \
    prettier-plugin-packagejson \
    markdownlint-cli2

# ---------- LuaRocks (hererocks) ----------
if ! command -v luarocks >/dev/null; then
    echo "Instalando luarocks via luarocks itself (bootstrap)..."
    sudo luarocks install luaposix
fi

# ---------- Pip (para Python provider) ----------
pipx ensurepath 2>/dev/null || true

# ---------- Limpeza e sync do Neovim ----------
echo "Limpando caches do Neovim..."
rm -rf ~/.cache/nvim ~/.local/share/nvim/lazy ~/.local/state/nvim ~/.local/share/nvim/mason

echo "Sincronizando LazyVim e Mason..."
nvim --headless -c "Lazy sync" -c "MasonUpdate" -c "qa"

# ---------- Mason (atualiza para v2.1.0) ----------
nvim -c "lua require('lazy').restore({wait=true})" -c "qa" # garante que lazy está carregado
nvim -c "MasonUpdate" -c "qa"

# ---------- PATH para .NET tools ----------
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >>~/.bashrc
source ~/.bashrc

# ---------- Limpeza de caches ----------
rm -rf ~/.cache/nvim \
    ~/.local/share/nvim/lazy \
    ~/.local/state/nvim \
    ~/.local/share/nvim/mason

# ---------- Sync final ----------
nvim -c "Lazy sync" -c "qa"

echo "=== PRONTO! Reinicie o Neovim e rode :checkhealth ==="
