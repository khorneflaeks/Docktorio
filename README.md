# Basic Usage

Modify the server-settings.json with your credentials and settings

Build the docker image

```bash
docker build -t factorio-server .
```

The init script will automatically create a new save game if none exists.

```bash
docker run -d \
           -p 34197:34197/udp \
           --name factorio-server \
           factorio-server
```

# Persisting Saves

Use a docker volume to persist the savegames on the host machine rather than in the docker container.

```bash
mkdir saves

# Make sure the saves dir can be written to by the "factorio" user in Docker, with uid 1000
sudo chown 1000:1000 saves
# (alternatively, if you don't have root): chmod 777 $(pwd)/saves

docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           factorio-server
```

To use your own saves place the save zip file to saves directory that is created. The file name has to be factorio_save.zip. Then start the container

# Mods

To use mods
```bash
mkdir mods
```
Copy all the wanted mods to the folder. Then you can build the  image with
```
docker build -t factorio-server .
```
Then start the container.
```
docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           factorio-server
```
Or use volume mount
```
docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -v $(pwd)/mods:/opt/factorio/mods \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           factorio-server
```
