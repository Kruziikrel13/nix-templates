{
  pkgs ? import <nixpkgs> { },
  package ? pkgs.callPackage ./package.nix { },
}:
pkgs.mkShell {
  inputsFrom = [ package ];
  packages = with pkgs; [
    cargo
    rustc
    rust-analyzer
    rustfmt
    lldb
  ];
}
