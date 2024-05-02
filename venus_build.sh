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

make clean
make clean_generated

# mkdir -p _output/bin/
# mkdir -p .make/_output/bin/

command=$@

case $command in
    "build")
        make all
        ;;
    "build-static")
        make all GOLDFLAGS='-extldflags "-static"'
        ;;
    "images")
        make all
        make release-images
        ;;
    "clean")
        make clean
        make clean_generated
        ;;
    "kubelet")
        make all WHAT=cmd/kubelet
        ;;
    *)
        echo "Unknown command: $command"
        ;;
esac
