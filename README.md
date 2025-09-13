# 🚀 Gensyn GPU Optimized vLLM Guide

**Optimized setup for running 1.5B on RTX 3090, 4090, or any GPU with ≥24GB VRAM**

⚡️ **Solves CUDA out of memory errors** for large models like 1.5B.

---

## ⚠️ Important: Backup Your Key First!

**If you're already running a Gensyn RL-Swarm node, make sure to backup your `.pem` file:**

---

## 🔑 Checklist

✅ A GPU with at least 24GB VRAM (RTX 3090, 4090, or equivalent)

✅ Python 3.10+ installed and working

✅ Backed-up .pem key file (required if upgrading an existing node)

✅ Stable internet connection to sync and run tasks smoothly

✅ 24GB VRAM + Minimum 32GB system RAM recommended for running large models without crashes

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
---

## 🎯 Recommended 1.5B Models

**Optimized models that work perfectly with this setup:**

* `nvidia/Nemotron-Research-Reasoning-Qwen-1.5B`
* `nvidia/AceInstruct-1.5B`
* `Gensyn/Qwen2.5-1.5B-Instruct`

These models are some specifically tested and optimized for 24GB VRAM GPUs.

---

### 🎯This setup is specifically optimized for:

- **RTX 3090** (24GB VRAM)
- **RTX 4090** (24GB VRAM)
- **Higher Model Gpu's as well**

---

## ✅ You're Done!

## ⚡ Performance Optimizations

�� **vLLM integration** delivers significantly faster inference speeds

🎯 **bfloat16 precision** reduces memory usage while maintaining stability

🔥 **Increase num_train_samples** to push your GPU utilization higher

📦 **Batch size tuning** optimized for 1.5B parameter models

💻 **Designed for 24GB GPUs** like RTX 3090 / 4090 for smooth training

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

**Show us your results!** Tag [@gasoline2255](https://x.com/gasoline2255) if this guide helped you successfully run 1.5B models on your GPU.

**Need help?** Contact me if you encounter any errors or have questions about the setup.

*Made with ❤️ for the Gensyn community*
