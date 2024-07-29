# nvim-setup
My neovim config 

## Dependencies
It would be nice if all setups could be processed only by config file but it not. While driving to Windows platform from Linux I decide to describe all dependencies I need to do.

1. Tree-sitter cli. Download binary or build from source and put in directory in PATH.
2. Install Node JS(On Windows I do it by nvm-windows)
3. Install python and pip
4. Using :Mason install followed packages:
   1. clang-format(if error occur, install by binary file from official cite)
   2. clangd
   3. cmake-language-server
   4. cpptools
   5. fantomas(if need f#)
   6. fsautocomplete(if need f#)
   7. netcoredbg(if need f#/c#)
   8. pyright
   9. stylua
   10. texlab
