{
  description = "A collection of nix flake templates for various languages";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  outputs =
    { self, nixpkgs }:
    {
      templates = {
        nix = {
          path = ./nix;
          description = "Nix Developer Shell";
        };
        shell = {
          path = ./shell;
          description = "Shell Shell Shell";
        };
      };
    };
}
