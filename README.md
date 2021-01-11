# docker-dogecoin

[![License](https://img.shields.io/github/license/timchurchard/docker-dogecoin.svg)](https://github.com/timchurchard/docker-dogecoin/blob/master/LICENSE)

yet another dogecoin docker

Dogecoin uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of dogecoin is carried out collectively by the network. Dogecoin is open-source; its design is public, nobody owns or controls Dogecoin and everyone can take part. Through many of its unique properties, Dogecoin allows exciting uses that could not be covered by any previous payment system.

This Docker image provides `dogecoin`, `dogecoin-cli` and `dogecoin-tx` applications which can be used to run and interact with a dogecoin server.

### Usage

To start a dogecoind instance running the latest version:

```
$ docker run timchurchard/dogecoin
```

See ./example.sh for more commands.

### License

Configuration files and code in this repository are distributed under the [MIT license](/LICENSE).
