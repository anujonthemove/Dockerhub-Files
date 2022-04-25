# Docker for WSL-Ubuntu

#### Build commands
docker build -t ubuntu-base -f dependencies .

docker build --no-cache -t ubuntu:user --build-arg USER_ID=$(id -u) --build-arg  GROUP_ID=$(id -g) -f main .

#### Run docker in background
docker run  -t -d -p HOST_PORT:CONTAINER_PORT --name ubuntu-user -v /home/YOUR_USER_NAME/:/home/user/mount  ubuntu:user

#### Exec into existing docker container
docker exec -it ubuntu-user bash
