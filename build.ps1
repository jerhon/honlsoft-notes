# Builds the Daux site into the directory ./dist
docker run -it --rm -v $PWD`:/build daux/daux.io daux generate --destination /build/dist