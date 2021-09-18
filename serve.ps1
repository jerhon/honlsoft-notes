# Builds the Daux site into the directory ./dist
docker run -it --rm -v $PWD`:/docs -p 8000:8000 squidfunk/mkdocs-material