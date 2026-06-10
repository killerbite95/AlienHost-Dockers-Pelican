# AlienHost Docker images for Pelican

Custom Pelican Java yolks with extra native X11/font packages for Minecraft mods that need desktop rendering libraries, including Mahou Tsukai's `libXrender.so.1` dependency.

## Images

These images are published by GitHub Actions to GHCR:

```text
ghcr.io/killerbite95/alienhost-dockers-pelican:java_8_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_11_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_16_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_17_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_19_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_21_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_22_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_25_x11
ghcr.io/killerbite95/alienhost-dockers-pelican:java_26_x11
```

## Added packages

Each image extends the matching official Pelican yolk:

```text
ghcr.io/pelican-eggs/yolks:java_VERSION
```

and installs:

```text
libxrender1
libxtst6
libxi6
libxext6
fontconfig
fonts-dejavu-core
```

## Build locally

Start Docker Desktop first on Windows. Then run:

```powershell
.\build-all.ps1 -Repository ghcr.io/killerbite95/alienhost-dockers-pelican
```

Build and push:

```powershell
docker login ghcr.io
.\build-all.ps1 -Repository ghcr.io/killerbite95/alienhost-dockers-pelican -Push
```

Build one version manually:

```powershell
docker build -t ghcr.io/killerbite95/alienhost-dockers-pelican:java_17_x11 .\java_17
```

## Use in Pelican

Use these tags in the Forge egg's `docker_images` section:

```json
"docker_images": {
  "Java 21 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_21_x11",
  "Java 17 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_17_x11",
  "Java 16 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_16_x11",
  "Java 11 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_11_x11",
  "Java 8 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_8_x11",
  "Java 25 X11": "ghcr.io/killerbite95/alienhost-dockers-pelican:java_25_x11"
}
```

If GHCR creates the package as private, set the package visibility to public or make sure your Pelican nodes are authenticated to GHCR.
