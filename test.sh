#!/usr/bin/env bash

set -ex

# build image
docker build -t rkawajiri/pandoc_resume .

# clean
rm -f resume.pdf resume.html resume.docx resume.rtf

# make
docker-compose run --rm make clean
docker-compose run --rm make

# omake
docker-compose run --rm omake clean
docker-compose run --rm omake
