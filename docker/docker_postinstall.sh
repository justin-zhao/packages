#!/bin/bash
#author: Shameer
#date: 05/11/2015
# Install docker on ubuntu

INSTALL_DOCKER_PACKAGES="YES"
if [ "$INSTALL_DOCKER_PACKAGES" = 'YES' ]; then
    Distribution=`cat /etc/issue| cut -d' ' -f 1`
    echo $Distribution

    case "$Distribution" in
        Ubuntu)
            #echo "Ubuntu Distribution"
# Justin commented them, because the update will be called only one times in main scripts for all packages
#            sudo apt-get -y update
#            if [ $? != 0 ];
#            then
#               echo "Docker script: apt-get update failed..."
#               exit 1
#            fi

            echo "Installing Docker on $Distribution..."
            sudo apt-get install -y docker.io
            if [ $? != 0 ];
            then
               echo "apt-get install docker.io failed..."
               exit 1
            fi
        ;;
        *)
            echo "Docker not installed as it is not supported/verified on $Distribution..."
            exit 1
        esac
        echo "Finished installation of Docker"
    fi

