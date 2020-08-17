# nginx-docker
 This project is an experiment to create optimized version of nginx docker image.

 Here I have created nginx image in 4 different ways.

 1. v1-simple 
    - using straight forward dockerfile instructions 
    - no optimization
    - image size 245MB

 2. v2-single-run-cmd 
    - merging all the run commands in one instruction,  building app first and then removing dependencies
    - everything is done in one command
    - increased complexity and compromised readability of Dockerfile
    - but we get optimized image of size 14.7MB

3. v3-builder-pattern
    - using shell script to extract and copy required files
    - image size 12.3MB

4. v4-multi-stage-build
    - image size 12.3MB