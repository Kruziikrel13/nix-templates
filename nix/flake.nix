{
  description = "Skeleton of a flake developer shell fit for any use case";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system (nixpkgs.legacyPackages.${system}));
    in
    {
      devShells = forEachSystem (
        system: pkgs: rec {
          default = import ./nix/shell.nix { inherit pkgs; };
        }
      );
    };
}
