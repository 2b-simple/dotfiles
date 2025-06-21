DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)"

# --- Functions ---
msg() {
    echo -e "\n\n\033[0;32m--- $1 ---\033[0m"
}

link_file() {
    local src=$1
    local dest=$2

    if [ -L "$dest" ]; then
        # ถ้าเป็น Link อยู่แล้วให้ข้ามไป
        echo "Symlink already exists: $dest"
        return
    fi

    if [ -f "$dest" ] || [ -d "$dest" ]; then
        # ถ้ามีไฟล์/โฟลเดอร์อยู่แล้ว ให้ย้ายไปเก็บเป็น Backup
        echo "Backing up existing file: $dest -> $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR"
    fi

    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

# --- Start working ---
# 1. Install essential packages
msg "Installing essential packages"
sudo -v
sudo apt update
sudo apt install -y vim git tmux curl htop build-essential

# 2. Create Symbolic Links
msg "Creating symbolic links"
files_to_link=(
    ".bash_aliases"
    ".bash_functions"
    ".vimrc"
    ".tmux.conf"
)

for file in "${files_to_link[@]}"; do
    link_file "$DOTFILES_DIR/$file" "$HOME/$file"
done

# 3. Add Path of scripts to .bashrc
msg "Configuring PATH for custom scripts"
# Check if Path is already added
if ! grep -q 'dotfiles/bin' "$HOME/.bashrc"; then
    echo "Adding dotfiles/bin to PATH in .bashrc"
    echo '' >> "$HOME/.bashrc"
    echo '# Add custom scripts from dotfiles' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/dotfiles/bin:$PATH"' >> "$HOME/.bashrc"
else
    echo "dotfiles/bin already in PATH."
fi

msg "Installation Complete!"
echo "Please run the following command to apply changes:"
echo "source ~/.bashrc"