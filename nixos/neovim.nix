{ config, pkgs, ... }:

{

programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  configure = {
    customRC = '' '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ ctrlp ];
    };
  };
};

}
