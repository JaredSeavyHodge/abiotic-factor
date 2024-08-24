#!/bin/bash

# Install or update the server
/usr/games/steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /gamefiles +login anonymous +app_update 2857200 +quit

# Launch the server using wine
wine /gamefiles/AbioticFactor/Binaries/Win64/AbioticFactorServer-Win64-Shipping.exe -log -newconsole -useperfthreads -NoAsyncLoadingThread -MaxServerPlayers=${MAX_PLAYERS} -PORT=7777 -QUERYPORT=27015 -tcp -ServerPassword=${SERVER_PASSWORD} -SteamServerName="${SERVER_NAME}" -WorldSaveName="Cascade" -logcmds "log LogFile.log" -logcmds "adminlog AdminLogFile.log" -logcmds "serverlog ServerLogFile.log" -logcmds "chatlog ChatLogFile.log" -logcmds "netlog NetLogFile.log"