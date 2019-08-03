# Mining the Social Web, 3rd Edition

The official code repository for Mining the Social Web, 3rd Edition (O'Reilly, 2019). The book is available from [Amazon](https://www.amazon.com/dp/1491985046/ref=cm_sw_r_cp_ep_dp_6M-hCbNY7BGB7) and [Safari Books Online](http://shop.oreilly.com/product/0636920056751.do).

The `notebooks` folder of this repository contains the latest bug-fixed sample code used in the book chapters.

## Quickstart

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mikhailklassen/Mining-the-Social-Web-3rd-Edition/master?filepath=notebooks%2F)

The easiest way to start playing with code right away is to use [Binder](https://mybinder.org). Binder is a service that takes a GitHub repository containing Jupyter Notebooks and spins up a cloud-based server to run them. You can start experimenting with the code without having to install anything on your machine. Click the badge above, or follow [this](https://mybinder.org/v2/gh/mikhailklassen/Mining-the-Social-Web-3rd-Edition/binder?filepath=notebooks%2F) link to get started right away.

**NOTE**: Binder will not save your files on its servers. During your next session, it will be a completely fresh instantiation of this repository. If you need a more persistent solution, consider running the code on your own machine.

### Getting started on your own machine using Docker

1. [Install Docker](https://www.docker.com/products/docker-desktop)
2. [Install `repo2docker`](https://github.com/jupyter/repo2docker): `pip install jupyter-repo2docker`
3. From the command line: 

```
repo2docker https://github.com/mikhailklassen/Mining-the-Social-Web-3rd-Edition
```

This will create a Docker container from the repository directly. It takes a while to finish building the container, but once it's done, you will see a URL printed to screen. Copy and paste the URL into your browser.

A longer set of instructions can be found [here](https://towardsdatascience.com/docker-without-the-hassle-b98447caedd8).

### Getting started on your own machine from source 

If you are familiar with git and have a `git` client installed on your machine, simply clone the repository to your own machine. However, it is up to you to install all the dependencies for the repository. The necessary Python libraries are detailed in the `requirements.txt` file. The other requirements are detailed in the **Requirements** section below.

If you prefer not to use a git client, you can instead [download a zip archive](https://github.com/mikhailklassen/Mining-the-Social-Web-3rd-Edition/archive/master.zip) directly from GitHub. The only disadvantage of this approach is that in order to synchronize your copy of the code with any future bug fixes, you will need to download the entire repository again. You are still responsible for installing any dependencies yourself.

Install all the prerequisites using pip:
```
pip install -r requirements.txt
```

Once you're done, step into the `notebooks` directory and launch the Jupyter notebook server:
```
jupyter notebook
```

### Side note on MongoDB

If you wish to complete all the examples in Chapter 9, you will need to install [MongoDB](https://www.mongodb.com/). We do not provide support on how to do this. This is for more advanced users and is really only relevant to a few examples in Chapter 9.

## Contributing

There are several ways in which you can contribute to the project. If you discover a bug in any of the code, the first thing to do is to create a new issue under the Issues tab of this repository. If you are a developer and would like to contribute a bug fix, please feel free to fork the repository and submit a pull request.

The code is provided "as-is" and we make no guarantees that it is bug-free. Keep in mind that we access the APIs of various social media platforms and their APIs are subject to change. Since the start of this project, various social media platforms have tightened the permissions on their platform. Getting full use out of all the code in this book may require submitting an application the social media platform of your choice for approval. Despite these restrictions, we hope that the code still provides plenty of flexibility and opportunities to go deeper.
