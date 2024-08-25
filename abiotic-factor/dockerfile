FROM steamcmd/steamcmd:latest

RUN apt update
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine64 wine32 \
    libasound2-plugins:i386 \
    libsdl2-2.0-0:i386 \
    libdbus-1-3:i386 \
    libsqlite3-0:i386

# Suppress non-blocking warnings.
ENV DBUS_FATAL_WARNINGS 0
ENV WINEDEBUG -all
ENV WINEPREFIX /usr/games/.wine

# Cleanup
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Environment Variables
ENV SERVER_PASSWORD=${SERVER_PASSWORD:-password}
ENV SERVER_NAME=${SERVER_NAME:-"Jared's Abiotic Server"}
ENV MAX_PLAYERS=${MAX_PLAYERS:-6}
ENV SERVER_BIND_ADDRESS=0.0.0.0

EXPOSE 7777/udp
EXPOSE 27015/udp

RUN mkdir -p /gamefiles/AbioticFactor/Binaries/Win64

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]