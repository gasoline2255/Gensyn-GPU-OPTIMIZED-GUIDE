python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip wheel setuptools
pip install -r requirements.txt
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install vllm
