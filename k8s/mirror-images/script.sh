#!/usr/bin/env bash

targetlist=( $(kubeadm --config to-config.yaml config images list ) )
index=0
for image in $(kubeadm --config from-config-beta.yaml config images list)
do
        targetname=${targetlist[${index}]}
        docker pull ${image}
        docker tag ${image} ${targetname}
        docker push ${targetname}
        echo "############################"
        index=$((index+1))
done