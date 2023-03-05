#!/bin/bash

cd $HOME
export TSFILE=tailscale_1.36.2_amd64.tgz
wget https://pkgs.tailscale.com/stable/${TSFILE} && \ tar xzf ${TSFILE} --strip-components=1
$HOME/tailscaled --tun=userspace-networking --state=mem: --socket=/var/tmp/tailscaled.sock --socks5-server=localhost:1055 &
$HOME/tailscale --socket=/var/tmp/tailscaled.sock up --authkey=$TSKEY --hostname=cc-nodejsdemo