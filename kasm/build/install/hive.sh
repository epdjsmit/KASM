#!/bin/bash
#https://opensecure.medium.com/your-own-free-security-incident-response-platform-in-minutes-bff8c25b45ac
sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest