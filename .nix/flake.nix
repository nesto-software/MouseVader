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

            # quick fix from: https://github.com/NixOS/nixpkgs/issues/256174
            (web-ext.overrideAttrs
              (finalAttrs: previousAttrs:
                {
                  preBuild = ''
                    export NODE_ENV=production
                  '';
                }))
          ];

          SHELL = "${pkgs.zsh}/bin/zsh";

          shellHook =
            let
              dashboard-id = "1b39ygq1gylo1xe2-9529a9d0ca12589d180de6e265502bcf";
              dashboard-theme = "dark";
            in
            ''
              export SHELL="${pkgs.zsh}/bin/zsh"
              export NESTO_NIX_DEVSHELL=1;

              export NESTO_DASHBOARD_URL="https://p.datadoghq.eu/sb/${dashboard-id}?refresh_mode=sliding&theme=${dashboard-theme}&tpl_var_env%5B0%5D=production&tpl_var_nesto_env%5B0%5D=production&live=true";
            '';
        };
      }
    );
}
