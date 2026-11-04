{ config, pkgs, ... }: {
  environment.shellAliases = {
    ll = "ls -la";
    gs = "git status";
    b  = "brightnessctl s";
    switch = "sudo nixos-rebuild switch ";
    switchd= "sudo nixos-rebuild switch && nix-collect-garbage";
  };
}

