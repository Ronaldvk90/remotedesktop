FROM debian:bookworm

# Install the nescesarry packages
RUN apt update ; apt upgrade -y

RUN apt install git curl wget thunderbird libreoffice i3 firefox-esr unzip xrdp rxvt-unicode vim openssh-server dbus-x11 nemo zsh -y
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
RUN echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
RUN mkdir -p /etc/debsig/policies/AC2D62742012EA22/
RUN curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
RUN mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
RUN apt update && apt install 1password -y
COPY i3 /i3
COPY i3status /i3status

# Prepare the files
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Finaly. run the server!
ENTRYPOINT [ "/entrypoint.sh" ]