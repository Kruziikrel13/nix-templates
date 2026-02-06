{
  description = "Nix flake developer shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forEachSystem (
        system: pkgs: {
          default = pkgs.mkShellNoCC {
            shellHook = ''
              export SHELL=${lib.getExe pkgs.bash}
            '';
            packages = with pkgs; [
              nil
              nixd
              statix
              nixfmt
            ];
          };
        }
      );
    };
}
