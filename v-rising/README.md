# V Rising Dedicated Server Image
Docker image to run V Rising dedicated server on Linux using Wine.

## Usage
### 1. Build the image
`docker buildx build .`

### 2. Start a container using the built image
`docker run -it -p 27015:27015/udp -p 27016:27016/udp -v /home/vrising/server-data:/vrising/server-data ${BUILT_IMAGE_SHA}`

## Credits
Written as a self-learning project based on Ponjimon's [repo](https://github.com/Ponjimon/vrising-docker/tree/main)