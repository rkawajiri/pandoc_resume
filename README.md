The Markdown Resume
===================

Instructions:

    git clone https://github.com/mszep/pandoc_resume
    cd pandoc_resume
    vim resume.md   #insert your own resume info
    make

Requirements:

 * ConTeXt
 * pandoc


## Build with Docker

When you don't want to directly install packages on your machine, you can build the resumes with docker by using the below command.

    docker-compose run --rm make
