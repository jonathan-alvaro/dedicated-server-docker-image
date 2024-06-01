# Valheim Dedicated Server Image
Docker image to run Valheim dedicated server

## Usage
### 1. Build the image
`docker buildx build .`

### 2. Start a container using the built image
`docker run -it -p 2456:2456/udp -p 2457:2457/udp -p 2458:2458/udp -v /home/valheim/server-data:/valheim/server_data ${BUILT_IMAGE_SHA}`

## Common Issues
### WorldGeneratorInstance was Null
Try to check if you have set the password in `env.list` file. For some reason, if this is not set correctly, this is the error message that appears.