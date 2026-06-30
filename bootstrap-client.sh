#!/usr/bin/env bash
set -euox pipefail


# pipx is per application python environment. It allows distribution of end tools - not libraries, but tools, ready to use in CLI.
sudo dnf install -y git python3-pip pipx

pipx ensurepath

# Install Ansible tools isolated from system Python
pipx install --include-deps ansible
pipx install --include-deps ansible-lint

# Make tools available in this script immediately
export PATH="$HOME/.local/bin:$PATH"

ansible --version
ansible-lint --version

# Repository with ansible set up

ANSIBLE_DIR="$HOME/.local/share/ansible"
INFRA_DIR="$ANSIBLE_DIR/infra"

mkdir -p "$ANSIBLE_DIR"

if [ ! -d "$INFRA_DIR/.git" ]; then
    git clone "https://github.com/nickobard/Personal-Ansible-Private.git" "$INFRA_DIR"
else
    git -C "$INFRA_DIR" pull --ff-only
fi

cd "$INFRA_DIR"

# ansible-galaxy collection install -r requirements.yml
# ansible-lint
# ansible-playbook playbooks/client.yml