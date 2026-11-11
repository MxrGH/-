# MatiX SMP — Paper 26.2

A GitHub Codespaces-ready Minecraft Java server setup using **Paper 26.2** and **Java 25**.

## Open in Codespaces

1. Open this repository: https://github.com/MxrGH/-
2. Select **Code → Codespaces → Create codespace on main**.
3. Wait for the devcontainer setup to finish.
4. In the Codespaces terminal, run:

   ```bash
   bash start.sh
   ```

The first run downloads the latest stable Paper 26.2 server JAR.

## Accept the Minecraft EULA

Before the server can start, read the [Minecraft EULA](https://aka.ms/MinecraftEULA). If you agree, create `eula.txt` in the repository root with:

```text
eula=true
```

Then run `./start.sh` again.

## Connect

Codespaces forwards TCP port **25565**. In the **Ports** tab, you can view the forwarded port. Set its visibility as needed. The server is only available while the Codespace is running, and Codespaces is a development environment—not 24/7 hosting.

## Useful commands

- Start: `./start.sh`
- Download/update the Paper JAR: delete `server.jar`, then run `bash scripts/download-paper.sh`
- Change memory: `MIN_RAM=1G MAX_RAM=3G ./start.sh`

Server files, worlds, logs, and plugins are ignored by Git so they are not accidentally committed. Back up your world separately before changing server versions.

## Requirements

- Java 25+
- Paper 26.2
- GitHub Codespaces with enough available memory
