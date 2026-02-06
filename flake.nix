{
  description = "A collection of nix flake templates for various languages";
  outputs =
    { self }:
    {
      templates = {
        shell = {
          path = ./shell;
          description = "Shell Shell Shell";
        };
        nix = {
          path = ./nix;
          description = "Nix Developer Shell";
        };
        rust = {
          path = ./rust;
          description = "Rust Developer Shell";
        };
      };
    };
}
