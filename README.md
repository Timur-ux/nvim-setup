# nvim-setup
My neovim config 

## Docker based setup

### build

There is Dockerfile with Ubuntu 24.04 based nvim setup, so if you have docker but not want to setup nvim locally you can:

```
$ docker built -t nvim-setup .
```

Approximatelly 10 min to build

	There will be few minutes gap with no log message at the end. This happened via Mason download heavy clangd LSP server(~100 MiB)

### usage

If you work on project in /some/path/to/project path you can create nvim container there with volume like:

```
$ docker run -it --name nvim --volume "/some/path/to/project:/app" nvim-setup
```

and continue work with it with:

```
$ docker start -i nvim
```
