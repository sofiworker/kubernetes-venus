#!/bin/bash

# make all GOLDFLAGS='-extldflags "-static"'

# make all WHAT=cmd/kube-apiserver GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kube-controller-manager GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kube-proxy GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kubeadm GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kubectl GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kubectl-convert GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kubelet GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'
# make all WHAT=cmd/kubemark GOFLAGS=-v GOLDFLAGS='-extldflags "-static"'

command=$@

case $command in
    "build")
        make clean
        make clean_generated
        make all
        ;;
    "clean")
        make clean
        make clean_generated
        ;;
    "kubelet")
        make clean
        make clean_generated
        make all WHAT=cmd/kubelet
        ;;
    *)
        echo "Unknown command: $command"
        ;;
esac
