git clone https://github.com/adityacaturputra/moshi.git
pip install -U moshi_mlx  # moshi MLX, from PyPI, best with Python 3.12.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"            # For sh/bash/zsh/ash/dash/pdksh
apt update
apt install pkg-config libssl-dev cmake 
pip install -U "huggingface_hub[cli]"
huggingface-cli login
cargo run --features cuda --bin moshi-backend -r -- --config moshi-backend/config.json standalone

# for frontend
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
cd client
npm install
npm run build
npm install -g serve
cd ./dist
serve