# 🚀 Gensyn GPU Optimized vLLM Guide

**Optimized setup for running 1.5B and 1.7B models on RTX 3090, 4090, or any GPU with ≥24GB VRAM**

⚡️ **Solves CUDA out of memory errors** for large language models on consumer GPUs

---

## ⚠️ Important: Backup Your Key First!

**If you're already running a Gensyn RL-Swarm node, make sure to backup your `.pem` file:**

---

## �� Prerequisites

* ✅ GPU with ≥24GB VRAM (RTX 3090, 4090, or any GPU with ≥24GB VRAM
* ✅ Python
* ✅ 24GB VRAM recommended
* ✅ Your backed up `.pem` file (if upgrading)

---

## ⚙️ Setup Steps

### 🔧 1. Update System

```bash
apt update && apt upgrade -y
```

### 📦 2. Install Dependencies

```bash
apt install screen curl iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y
```

### 🐍 3. Install Python

```bash
apt install python3 python3-pip python3-venv python3-dev -y
```

### 📱 4. Install Node.js and Yarn

```bash
# Install Node.js
apt update
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt install -y nodejs
node -v

# Install Yarn
npm install -g yarn
yarn -v
```

### 🖥️ 5. Create Screen Session

```bash
screen -S gensyn
```

---

## 🚀 Installation (Choose Your Path)

### 🔄 **Path A: Upgrading Existing Node**

If you're already running a node, detach from your current RL-Swarm screen and follow this:

```bash
# Detach from current screen (Ctrl + A, then D)
# Then run:
cd $HOME && \
rm -rf rl-swarm && \
git clone https://github.com/gasoline2255/gensyn-testnet.git && \
cd gensyn-testnet && \
git clone https://github.com/gasoline2255/genrl
```

### 🆕 **Path B: Fresh Installation**

If you're starting from scratch, follow this:

```bash
cd $HOME && \
git clone https://github.com/gasoline2255/gensyn-testnet.git && \
cd gensyn-testnet && \
git clone https://github.com/gasoline2255/genrl
```

---

## �� 6. Restore Your Key

**Important:** Make sure to add your `.pem` file inside the `gensyn-testnet` folder:

---

## �� 7. Set Up Python Environment and Install vLLM

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install vllm
```

---

## ⚡ 8. Run RL-Swarm

```bash
./run_rl_swarm.sh
```

Waiting for localhost:3000...

**open a new window**

---

## 🌐 9. Expose Your Service (Optional)

### �� Option A: LocalTunnel

```bash
npm install -g localtunnel
curl https://loca.lt/mytunnelpassword
lt --port 3000
```
### ☁️ Option B (Safe & quick)
```bash
apt-get update && apt-get install -y openssh-client
ssh -o StrictHostKeyChecking=no -R 80:localhost:3000 nokey@localhost.run
```

## ⚡ Performance Optimizations

### 🎯 GPU Memory Optimization

This setup is specifically optimized for:
- **RTX 3090** (24GB VRAM)
- **RTX 4090** (24GB VRAM)

The setup automatically enables:
- ✅ **vLLM integration** for faster inference
- ✅ **FP16 precision** to reduce memory usage
- ✅ **Gradient checkpointing** for memory efficiency
- ✅ **Optimized batch sizes** for large models

### Import Errors

```bash
# Reinstall dependencies
cd genrl && pip install -e . && cd ..
```

### Screen Session Issues

```bash
# List all screen sessions
screen -ls

# Reconnect to your session
screen -r gensyn
```

---

## ✅ You're Done!

Your **GPU-optimized Gensyn RL-Swarm** is now running with:

- ✅ **vLLM integration** for 10x faster inference
- ✅ **Memory optimizations** for large models
- ✅ **1.5B and 1.7B model support** on consumer GPUs
- ✅ **Complete training environment** ready to use

---

## 🎯 Quick Commands

```bash
# Start RL-Swarm
cd gensyn-testnet && ./run_rl_swarm.sh

# Check GPU status
nvidia-smi

# Monitor training
watch -n 1 nvidia-smi

# Reconnect to screen
screen -r gensyn
```

---

**Happy Training! 🚀**

*This guide solves CUDA out of memory errors for large language models on consumer GPUs.*
