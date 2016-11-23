FROM haskell:7.10.3

MAINTAINER Ryoma Kawajiri <ryoma.edison@gmail.com>

ENV PANDOC_VERSION "1.18"

# Install pandoc
RUN set -ex \
 && cabal update \
 && cabal install \
    pandoc-${PANDOC_VERSION} \
 && rm -rf ~/.cabal/packages ~/.cabal/logs

# Install latex packages
RUN set -ex \
 && apt-get update -y \
 && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    context \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /source
