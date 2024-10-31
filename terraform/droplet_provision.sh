#!/bin/bash
apt update && apt install -y docker.io
systemctl start docker
systemctl enable docker
