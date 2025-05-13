# installling git and py
sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo apt install git
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.12
sudo apt install pip
sudo apt install python3.12-venv
python3.12 -m venv .env
source .env/bin/activate

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-9
sudo apt-get install -y nvidia-open
sudo apt-get install -y cuda-drivers

pip install -U moshi_mlx  # moshi MLX, from PyPI, best with Python 3.12.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"            # For sh/bash/zsh/ash/dash/pdksh

git clone https://github.com/adityacaturputra/moshi.git
apt update
apt install pkg-config libssl-dev cmake 
pip install -U "huggingface_hub[cli]"
apt-get install libportaudio2
huggingface-cli login
cargo update -p cudarc
export CUDA_ROOT=/usr/local/cuda
export CUDA_PATH=/usr/local/cuda
export CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
export PATH=/usr/local/cuda/bin:$PATH
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