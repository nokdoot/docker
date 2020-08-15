FROM archlinux:latest

RUN yes | pacman -Syu

RUN yes | pacman -S reflector

RUN yes | reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist

RUN yes | pacman -S core/which

RUN yes | cpan Carton

COPY install.sh . 

RUN ./install.sh
