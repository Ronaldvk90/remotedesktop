FROM debian:bookworm

# Environment variables for locales
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install the nescesarry packages
RUN apt update ; apt upgrade -y
RUN apt install git curl wget thunderbird libreoffice i3 firefox-esr unzip xrdp rxvt-unicode vim openssh-server dbus-x11 nemo zsh feh locales -y
#

# Generate the nescesarry locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8
#

RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
RUN echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
RUN mkdir -p /etc/debsig/policies/AC2D62742012EA22/
RUN curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
RUN mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
RUN apt update && apt install 1password -y

# Prepare the runtime
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#

# Finaly. run the server!
ENTRYPOINT [ "/entrypoint.sh" ]
