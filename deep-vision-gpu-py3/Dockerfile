FROM nvcr.io/nvidia/tensorflow:19.07-py3

LABEL maintainer="Anuj Khandelwal (anujonthemove) <anujonthemove@gmail.com>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata sudo

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

ADD install_opencv_dependencies.sh /home/${user}
RUN sh install_opencv_dependencies.sh
RUN rm install_opencv_dependencies.sh

ADD reinstall_cmake.sh /home/${user}
RUN sh reinstall_cmake.sh
RUN rm reinstall_cmake.sh

ADD configure_install_opencv.sh /home/${user}
RUN sh configure_install_opencv.sh
RUN rm configure_install_opencv.sh

ADD requirements.txt /home/${user}
RUN sudo pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt


##REF
# https://unix.stackexchange.com/questions/410579/change-the-python3-default-version-in-ubuntu
# https://stackoverflow.com/questions/41986507/unable-to-set-default-python-version-to-python3-in-ubuntu
# https://serverfault.com/questions/836846/host-mountpoint-inside-docker-volume-inconsistency