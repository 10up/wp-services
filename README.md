# wp-services

> This image extends the wp-php-fpm image to include tools useful for initializing, running and maintaining a WordPress installation. It can be deployed as part of a Kubernetes based installation of WordPress. This image also includes 10up's [snapshots](https://github.com/10up/snapshots/releases) tool.

[![Support Level](https://img.shields.io/badge/support-active-green.svg)](#support-level) [![MIT License](https://img.shields.io/github/license/10up/wp-services.svg)](https://github.com/10up/wp-services/blob/master/LICENSE)

## Supported tags

* Ubuntu 22.04 based (Docker Hub)
  * 10up/wp-services:7.0-ubuntu
  * 10up/wp-services:7.1-ubuntu
  * 10up/wp-services:7.2-ubuntu
  * 10up/wp-services:7.3-ubuntu
  * 10up/wp-services:7.4-ubuntu
  * 10up/wp-services:8.0-ubuntu
  * 10up/wp-services:8.1-ubuntu
  * 10up/wp-services:8.2-ubuntu
  * 10up/wp-services:8.3-ubuntu
* Ubuntu 22.04 based (Github Packages)
  * ghcr.io/10up/wp-services:7.0-ubuntu
  * ghcr.io/10up/wp-services:7.1-ubuntu
  * ghcr.io/10up/wp-services:7.2-ubuntu
  * ghcr.io/10up/wp-services:7.3-ubuntu
  * ghcr.io/10up/wp-services:7.4-ubuntu
  * ghcr.io/10up/wp-services:8.0-ubuntu
  * ghcr.io/10up/wp-services:8.1-ubuntu
  * ghcr.io/10up/wp-services:8.2-ubuntu
  * ghcr.io/10up/wp-services:8.3-ubuntu
* Ubuntu 24.04 based (Docker Hub)
  * 10up/wp-services:7.0-noble
  * 10up/wp-services:7.1-noble
  * 10up/wp-services:7.2-noble
  * 10up/wp-services:7.3-noble
  * 10up/wp-services:7.4-noble
  * 10up/wp-services:8.0-noble
  * 10up/wp-services:8.1-noble
  * 10up/wp-services:8.2-noble
  * 10up/wp-services:8.3-noble
* Ubuntu 24.04 based (Github Packages)
  * ghcr.io/10up/wp-services:7.0-noble
  * ghcr.io/10up/wp-services:7.1-noble
  * ghcr.io/10up/wp-services:7.2-noble
  * ghcr.io/10up/wp-services:7.3-noble
  * ghcr.io/10up/wp-services:7.4-noble
  * ghcr.io/10up/wp-services:8.0-noble
  * ghcr.io/10up/wp-services:8.1-noble
  * ghcr.io/10up/wp-services:8.2-noble
  * ghcr.io/10up/wp-services:8.3-noble

## Usage

This image runs just php-fpm and expects that files are located at `/var/www/html`. They can be mounted or copied there using an init container. Running this image might look like this:

```
docker run -d --name wp-services \
  -v /var/www/html:/var/www/html
  10up/wp-services
```

This image is configured with MSMTP for handling email. It can only be configured to talk to an even smarter smart host meaning it cannot be configured with authentication of any sort. To configure MSMTP pass the following environment variables

* `MAILER_HOST=<your mailer host>`
* `MAILER_PORT=<your mailer hosts port>`

The entrypoint script will then configure MSMTP properly.

## Building

This image uses GitHub actions. For it to work you must create an environment called Build and then create the following variables:

`IMAGE_NAME` - The name of the image. For example, 10up sets this value to `10up/wp-services`. You must set this to your own Docker hub namespace.
`DOCKERHUB_USERNAME` - The username for the Docker hub account you wish to push images to.
`DOCKERHUB_TOKEN` - The token to use against your Docker hub account.
`BASE_IMAGE` - The base image to build this image from. Typically this is `10up/wp-php-fpm`. If you are also customizing the wp-php-fpm image then setting this variable will ensure wp-services is built from your customized base image.

## Support Level

**Active:** 10up is actively working on this, and we expect to continue work for the foreseeable future including keeping tested up to the most recent version of WordPress.  Bug reports, feature requests, questions, and pull requests are welcome.

## Like what you see?

<p align="center">
<a href="http://10up.com/contact/"><img src="https://10up.com/uploads/2016/10/10up-Github-Banner.png" width="850"></a>
</p>

