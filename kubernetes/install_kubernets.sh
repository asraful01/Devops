#!/bin/bash
echo "checking if virtualization supported in linux"
grep -E --color 'vmx|svm' /proc/cpuinfo

echo "Installing minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-     linux-amd64 \ && chmod +x minikube

echo "moving minikube file to local bin"
 sudo mv minikube /usr/local/bin/minikube

echo "installing kubectl on linux"

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

echo "make kubectl executable"
chmod +x ./kubectl

echo "move the binary in to your PATH"

sudo mv ./kubectl /usr/local/bin/kubectl

echo "test"

kubectl version --client