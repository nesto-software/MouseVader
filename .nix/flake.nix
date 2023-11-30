{
  description = "Firefox Extension to generate artificial mouse events";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        # enables use of `nix shell`
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            bashInteractive
            web-ext
          ];

          SHELL = "${pkgs.zsh}/bin/zsh";

          shellHook = ''
            export SHELL="${pkgs.zsh}/bin/zsh"
            export NESTO_NIX_DEVSHELL=1;
          '';
        };
      }
    );
}
