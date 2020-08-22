  # nginx-docker

This project is an experiment to create optimized version of nginx docker image.

Here I have created nginx image in 4 different ways.

v1-simple:
  - Using straight forward dockerfile instructions
  - No optimization
  - Image size 245MB
  
v2-single-run-cmd:
  - Merging all the run commands in one instruction,  building app first and then removing dependencies
  - Everything is done in one command
  - Increased complexity and compromised readability of Dockerfile
  - But we get optimized image of size 14.7MB
  
v3-builder-pattern:
  - Using shell script to extract and copy required files
  - Image size 12.3MB
  
v4-multi-stage-build:
  - Image size 12.3MB


docker container export -o nginx.tar $(docker container ls -lq)

tar -xvf nginx.tar | grep nginx-1.19.2

7z l .\nginx.tar nginx-1.19.2 -r


docker image import lighttpd-1.1.tar lighttpd.1.1

docker image history light:1.1 | tranc

unrealibe || scary