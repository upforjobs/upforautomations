#!/bin/bash

docker build -f Dockerfile -t upforautomation-prod .

aws ecr get-login-password --region eu-west-2 --profile upforjobs | docker login --username AWS --password-stdin 041144432460.dkr.ecr.eu-west-2.amazonaws.com

docker tag upforautomation-prod 041144432460.dkr.ecr.eu-west-2.amazonaws.com/upforautomation-prod:latest

docker push 041144432460.dkr.ecr.eu-west-2.amazonaws.com/upforautomation-prod:latest