FROM ubuntu:latest

LABEL maintainer="Anuj Khandelwal (anujonthemove) <anujonthemove@gmail.com>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends sudo

USER root

# issue found at: https://github.com/jupyter/docker-stacks/issues/815
# other color schemes: https://askubuntu.com/questions/123268/changing-colors-for-user-host-directory-information-in-terminal-command-prompt
# taken from: https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
# Enable prompt color in the skeleton .bashrc before creating the default a user 
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc

ENV user ubuntu

# taken from: :http://gbraad.nl/blog/non-root-user-inside-a-docker-container.html
RUN useradd -m -d /home/${user} ${user} && \
    chown -R ${user} /home/${user} && \
    adduser ${user} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}

WORKDIR /home/${user}

USER ${user}

ADD ubuntu_installations.sh /home/${user}
RUN sudo sh ubuntu_installations.sh
RUN sudo rm ubuntu_installations.sh

ADD requirements.txt /home/${user}
RUN sudo -H pip install -r requirements.txt
RUN sudo rm requirements.txt
RUN sudo rm get-pip.py

EXPOSE 8888


##REF
# https://unix.stackexchange.com/questions/410579/change-the-python3-default-version-in-ubuntu
# https://stackoverflow.com/questions/41986507/unable-to-set-default-python-version-to-python3-in-ubuntu
# https://serverfault.com/questions/836846/host-mountpoint-inside-docker-volume-inconsistency