#!/bin/bash

if ! command -v ansible >/dev/null; then
    echo "Installing Ansible dependencies..."
    if command -v yum >/dev/null; then
        sudo yum install -y python python-devel
    elif command -v apt-get >/dev/null; then
        sudo apt-get update -qq
        sudo apt-get install --yes -qq --no-install-recommends software-properties-common
        echo "Adding Ansible PPA repository..."
        sudo apt-add-repository --yes ppa:ansible/ansible
        sudo apt-get update -qq
        echo "Installing Ansible..."
        sudo apt-get install --yes -qq --no-install-recommends ansible
    else
            echo "Neither yum nor apt-get found!"
            exit 1
    fi
fi
