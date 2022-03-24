# Description

This is an alpine based image adding some tools :

- [JQ](https://github.com/stedolan/jq)
- [cURL](https://curl.se/)
- [wget](https://www.gnu.org/software/wget/)
- bash

[GitHub link](https://github.com/thouet-sigma/docker-curl-wget-jq)

# Build

```bash
$ docker build -t wget-curl-jq:alpine-1.0 .
```

# Use
```bash
$ docker run -it -rm -v ${PWD}:/usr/src/ wget-curl-jq:1.0 XXX
# Where XXX is a bash script.
```