#!/bin/bash
apt-get update
ssh -V
sudo adduser terminal &&
sudo usermod -aG sudo terminal &&
sudo mkdir ~terminal/.ssh
sudo touch  ~terminal/.ssh/authorized_keys
sudo chmod 600 ~terminal/.ssh/authorized_keys
sudo chmod 700 ~terminal/.ssh/
sudo chown -R terminal:terminal  /home/terminal/.ssh
