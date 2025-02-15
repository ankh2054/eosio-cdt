![SVG logo](https://www.sentnl.io/sentnl.svg)
          ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

# EOSIO-CDT  



**ENV Variables - These will make sense once you get into the Installation Part of the process.**

|ENV & ARG                 |Value                                  |Description                           |
|--------------------------|---------------------------------------|--------------------------------------|
|**CDT_BINARY**            |`url of deb url`                       | CDT DEB release url                  |


# Installation Steps to get started

## Step 1 - Build the docker container from github.

The first step is to buld the docker container from github 

### The following ENV variables need to be passed:

- **CDT_BINARY** - Specify the DEB file you want to install.

**To build it:**

```Dockerfile
docker build  git@github.com:ankh2054/eosio-cdt.git  \
-t eosio-cdt.version \
--build-arg CDT_BINARY=https://github.com/EOSIO/eosio.cdt/releases/download/v1.8.1/eosio.cdt_1.8.1-1-ubuntu-20.04_amd64.deb
```


**To run it:**

```Dockerfile
docker run  --name eosio-cdt.1.8.1  -d eosio-cdt.version:latest
```
