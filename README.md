# Mining-the-Social-Web-3rd-Edition

The official online compendium for Mining the Social Web, 3rd Edition (O'Reilly, 2018). The `notebooks` folder of this repository contains the latest bug-fixed sample code used in the book chapters.

## Quickstart

There are several ways to get up and running with the sample code in MTSW, which we detail in this section.

### Cloning or Downloading the Repository

If you are familiar with git and have a git client installed on your machine, simply clone the repository to your own machine. However, it is up to you to install all the dependencies for the repository. The necessary Python libraries are detailed in the `requirements.txt` file. The other requirements are detailed in the *Requirements* section below.

You may also [download a zip archive](https://github.com/mikhailklassen/Mining-the-Social-Web-3rd-Edition/archive/master.zip) directly from GitHub. The only disadvantage of this approach is that in order to synchronize your copy of the code with any future bug fixes, you will need to download the entire repository again. You are still responsible for installing any dependencies yourself.

### Using Docker

Docker is a tool for creating a "containerized" version of software that is independent of the underlying operating system. The included `Dockerfile` is the recipe that creates an "image" of all the software you need to run the sample code for MTSW, including all of the dependencies. This software image runs within the container managed by the Docker client on your machine.

The authors recommend using Docker. You won't have to worry about which operating system you're using, whether Windows, MacOS, or some Linux variant. You also won't have to worry about installing anything beyond the Docker client.

#### Installing Docker

Visit the [Docker Store](https://store.docker.com/search?type=edition&offering=community) and download the free Docker CE (Community Edition) for your operating system.

To make sure that the Docker client installed correctly, type the following from the command line.
```
docker --version
```
This should display something like
```
Docker version 17.12.0-ce, build c97c6d6
```
If so, congratulations, you've successfully installed Docker.

The next thing will be to build the image from the `Dockerfile`. From within the same directory as this repository's `Dockerfile`, type
```
docker build -t mtsw3e .
```
This will "tag" your image with the name `mtsw3e`. Building the image will take some time. The Docker client has to download a base image and then install all of the dependencies. You will only need to do this once, provided you don't delete the image from your computer.

You should see the image in your list of images:
```
$ docker image ls

REPOSITORY            TAG                 IMAGE ID
mtsw3e                latest              326387cea398
```

The last step is to launch a Docker container running your image:
```
docker run -it --rm -p 8888:8888 mtsw3e --name mtsw
```
The added `-it` flags will maintain an interactive terminal connection to the running container. `--rm` will cause the container to be deleted on exit (but not the image). The `-p 8888:8888` tag maps port 8888 on your operating system to port 8888 inside the container,  and `--name mtsw` just gives the container a friendly name.

Lastly, open a web browser and navigate to [http://localhost:8888][http://localhost:8888]. You should see a Jupyter Notebook server running and a list of all the Jupyter Notebooks that are a part of this repository.

## Requirements

TODO

## Contributing

There are several ways in which you can contribute to the project. If you discover a bug in any of the code, the first thing to do is to create a new issue under the Issues tab of this repository. If you are a developer and would like to contribute a bug fix, please feel free to fork the repository and submit a pull request.
