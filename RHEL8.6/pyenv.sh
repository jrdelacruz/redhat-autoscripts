#!/bin/bash
#
# Copyright (C) 2023 James Roi Dela Cruz <dcjamesroi@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Run a harmless command with sudo to test sudo access
sudo -n true 2>/dev/null

# Check if user has a sudo access
if [ $? -ne 0 ]; then
    echo "This script requires user with sudo access."
fi

# Clone PyEnv Repository to ~/.pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Add the commands to ~/.bashrc
if [ -f ~/.bashrc ]; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
fi

# Add the commands to ~/.bashrc
if [ -f ~/.profile ]; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
  echo 'eval "$(pyenv init -)"' >> ~/.profile
fi

# Add the commands to ~/.bash_profile
if [ -f ~/.bash_profile ]; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
fi

exec "$SHELL"

# Install the Prerequisites Packages
sudo dnf groupinstall -y "Development Tools" --releasever=8.6
sudo dnf install -y bzip2-devel ncurses-devel readline-devel openssl-devel sqlite-devel --releasever=8.6
