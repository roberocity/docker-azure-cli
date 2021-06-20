# roberocity/docker-azure-cli

Dockerfile for running the Azure CLI on Alpine Linux

## Usage

```bash 
docker pull robsutherand/azure-cli
```

## Build

I have docker hub building a new image when a commit is made to this repository.
If needed, you can build your own locally. 

```bash 
docker build -t robsutherland/azure-cli . 
```


## Reasons to Build My Own Image

I've been using a Rasperberry Pi 4 lately for my side projects and programming
language exploration. So I needed a way to use the [Azure CLI][az-cli]. The Azure CLI
won't install natively on the Pi and the [offical image from Microsoft][mcr-az] won't run
either. This was a way to give me access to the CLI. 

## Pitfalls

Running anything within a Docker container on the Pi is a bit slow. This is no
exception.

## Additional Setup and Configuration

In order to use this more like a native installation of the Azure CLI I create
an alias in my profile script. 

```bash
alias az='docker run --rm -it \
          -v ~/.ssh:/root/.ssh \ 
          -v ~/.azure:/root/.azure \ 
          -v $(pwd):/root \ 
          robsutherland/azure-cli:latest az '
```

Now I can run `az [command] [options...]` as if it were native. The alias mounts
my local `~/.ssh` and `~/.azure` directories. It also mounts the current
directory as the location where `az` will run from.

----

#### References

- I used [matsuu/docker-azure-cli][matsuu] Dockerfile as a starting point.
- [Azure CLI documentation][az-ref]


[matsuu]:https://github.com/matsuu/docker-azure-cli
[az-ref]:https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest
[mcr-az]:https://hub.docker.com/_/microsoft-azure-cli
