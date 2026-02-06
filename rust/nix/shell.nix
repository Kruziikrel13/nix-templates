{
  pkgs ? import <nixpkgs> { },
  package ? pkgs.callPackage ./package.nix { },
}:
pkgs.mkShellNoCC {
  name = "Rust Developer Shell";
  shellHook = ''
    export SHELL=${pkgs.lib.getExe pkgs.bash}
  '';

  inputsFrom = [ package ];
  packages = with pkgs; [
    cargo
    rustc
    rustfmt
    rust-analyzer
    lldb
  ];
}
