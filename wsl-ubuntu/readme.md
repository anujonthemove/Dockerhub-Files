# Docker for WSL-Ubuntu

#### Build commands
docker build -t ubuntu-base -f dependencies .
docker build --no-cache -t ubuntu:user --build-arg USER_ID=$(id -u) --build-arg  GROUP_ID=$(id -g) -f main .

#### Run docker in background
docker run  -t -d -p <port>:<port> --name ubuntu-user -v /home/<User>/:/home/user/mount  ubuntu:user

#### Exec into existing docker container
docker exec -it ubuntu-user bash