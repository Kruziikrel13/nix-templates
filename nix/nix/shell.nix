{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  shellHook = ''
    export SHELL=${pkgs.lib.getExe pkgs.bash}
  '';
  packages = with pkgs; [
    nil
    nixd
    statix
    nixfmt
  ];
}
