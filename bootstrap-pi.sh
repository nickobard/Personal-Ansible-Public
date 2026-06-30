#!/usr/bin/env bash
set -euxo pipefail

sudo apt update
sudo apt install -y git pipx gh python3-venv

pipx ensurepath || true
export PATH="$HOME/.local/bin:$PATH"

pipx install --include-deps ansible || pipx upgrade ansible

ansible --version

ANSIBLE_DIR="$HOME/.local/share/ansible"
INFRA_DIR="$ANSIBLE_DIR/infra"
PRIVATE_REPO="nickobard/Personal-Ansible-Private"

mkdir -p "$ANSIBLE_DIR"

if ! gh auth status >/dev/null 2>&1; then
    gh auth login --web
fi

gh auth setup-git

if [ ! -d "$INFRA_DIR/.git" ]; then
    gh repo clone "$PRIVATE_REPO" "$INFRA_DIR"
else
    git -C "$INFRA_DIR" pull --ff-only
fi

cd "$INFRA_DIR"

# ansible-galaxy collection install -r requirements.yml
# ansible-playbook playbooks/pi.yml