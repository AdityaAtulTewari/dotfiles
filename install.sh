sudo apt update -y && sudo apt install -y \
	zsh \
	tmux \
	golang \
	ripgrep \
	make


# Install nvim
# TODO: make this use /tmp
if ! command -v nvim;  then 
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
	rm nvim-linux-x86_64.tar.gz
	ln -s /opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/
fi

# Install nix
if ! command -v nix; then
	curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
fi

# Install uv
if ! command -v uv; then 
	curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Install rust
if ! command -v rustup; then 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install opencode
if ! command -v opencode; then
	curl -fsSL https://opencode.ai/install | bash
fi

# ghostty terminfo
if ! infocmp -x xterm-ghostty > /dev/null; then
	workdir=$(mktemp -d)
	cd "$workdir"

	# Download and extract Debian's terminal definitions.
	curl -fsSL \
	    'https://deb.debian.org/debian/pool/main/n/ncurses/ncurses-term_6.5+20250216-2_all.deb' \
	    -o "$workdir/ncurses-term.deb"

	dpkg-deb --extract \
	    "$workdir/ncurses-term.deb" \
	    "$workdir/extracted"


	# Set the correct primary name, retain the alias, and install.
  	infocmp -x -A "$workdir/extracted/usr/share/terminfo" ghostty |
  	  sed 's/^ghostty|/xterm-ghostty|ghostty|/' |
  	  tic -x -o "$HOME/.terminfo" -
	
	rm -r $workdir
fi

# Install jj
if ! command -v jj; then
	cargo install --locked --bin jj jj-cli
fi
