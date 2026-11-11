#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f server.jar ]]; then
  ./scripts/download-paper.sh
fi

if [[ ! -f eula.txt ]] || ! grep -q '^eula=true$' eula.txt; then
  echo "Minecraft EULA has not been accepted."
  echo "Read https://aka.ms/MinecraftEULA, then create eula.txt containing exactly:"
  echo "eula=true"
  exit 1
fi

JAVA_MAJOR="$(java -version 2>&1 | head -n 1 | sed -E 's/.*version "([0-9]+).*/\1/')"
if [[ "${JAVA_MAJOR}" -lt 25 ]]; then
  echo "Paper 26.2 requires Java 25 or newer. Found Java ${JAVA_MAJOR}."
  exit 1
fi

: "${MIN_RAM:=1G}"
: "${MAX_RAM:=3G}"
echo "Starting MatiX SMP (Paper 26.2)..."
exec java "-Xms${MIN_RAM}" "-Xmx${MAX_RAM}" -jar server.jar --nogui
