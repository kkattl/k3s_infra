set -euxo pipefail

useradd -m -s /bin/bash ansible
echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible

apt-get update -y
apt-get install -y docker.io curl

curl -sfL https://get.k3s.io | sh -
