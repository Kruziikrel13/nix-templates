{
  description = "Rust flake developer shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forEachSystem (
        system: pkgs: rec {
          package = pkgs.callPackage ./nix/package.nix { };
          default = package;
        }
      );

      devShells = forEachSystem (
        system: pkgs: {
          default = import ./nix/shell.nix {
            inherit pkgs;
            inherit (self.packages.${system}) package;
          };
        }
      );
    };
}
