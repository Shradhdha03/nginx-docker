# nginx-docker

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
