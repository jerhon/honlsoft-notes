docker run -it --rm -v $PWD`:/build -p 127.0.0.1:8085:8085 --name daux-hs-arch daux/daux.io bash -c "daux serve --host `$HOSTNAME"