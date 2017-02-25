#!/usr/bin/env bash

set -ex

rm -f resume.pdf
docker build -t rkawajiri/pandoc_resume .
docker-compose run --rm make clean
docker-compose run --rm make
