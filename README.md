docker-behat
============

This repository is based on `tvial/behat` and brings a simplified version of it :  
- a basic shell 
- php5-cli with PHP 5.5  
- behat 3.0 / mink 1.5  
- all needed dependencies  

## Usage

On your host, you can add the `behat()` function to your shell environnement:  

    function behat() { sudo docker run -t -i --rm -h docker-behat -v $(pwd):/var/behat/data:rw yaron/behat /var/behat/behat "$*" ;}

You can now call `behat` command from your host, it will be executed in your docker container.
Note that the container will be removed when the behat process will end usins `--rm`.  
A `data` folder is mounted read/write to your current folder (the one you launched docker-behat).  

Or:

    docker run -t -i -h docker-behat -v $(pwd):/var/behat/data:rw yaron/behat /bin/sh  

You should see a prompt containing `[ docker-behat ]` and have `behat` command available.  

## Build

If you need adapt the project to your needs, clone, modify the `Dockerfile` and from the source directory, run:

    docker build -t yaron/behat .
