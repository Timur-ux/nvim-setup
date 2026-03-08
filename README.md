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

#### How use with unity and c\# scripts

By default omnisharp language server installed and will works if you have .NET sdk installed(i tested on sdk v10)

If you want to use it with Unity you need do thing we called 'Танцы с Бубном'.

Main difficult there is that omnisharp needs .csproj file where links to Unity libraries are set. By default Unity don't create it.

In order to solve this issue we will use [nvim-unity](https://github.com/apyra/nvim-unity) package:

1. Install package(in unity package manager by [git link](https://github.com/apyra/nvim-unity.git) 
2. Add neovim code editor as [external tool](https://github.com/apyra/nvim-unity#unity)
3. Install nvimunity script(best and union way I use is [this](https://github.com/apyra/nvim-unity#-linux) with 'Just using a script' variant

So after this steps done you can generate .csproj file in unity editor (Tools > Neovim Code Editor > Regenerate Project Files)

With third step done you can open script files in terminal by double clicking on them in unity editor menu

	Warning! Don't use spaces in project path! They broke cmd for omnisharp. Replacing them by escaped version of space also don't work because by some reason it inserted as double slash + space but not slash + space --\_(-_-)_/--


