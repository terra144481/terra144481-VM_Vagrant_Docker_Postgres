#!/bin/bash
apt-get update
ssh -V
sudo adduser thermo
sudo usermod -aG sudo thermo
sudo mkdir ~thermo/.ssh
sudo touch  ~thermo/.ssh/authorized_keys
sudo chmod 600 ~thermo/.ssh/authorized_keys
sudo chmod 700 ~thermo/.ssh/
sudo chown -R thermo:thermo  /home/thermo/.ssh
sudo usermod -aG docker thermo
