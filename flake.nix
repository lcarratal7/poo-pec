# SPDX-FileCopyrightText: 2025 Lucas Carratalá Del Toro <lcarratal7@alumno.uned.es>
#
# SPDX-License-Identifier: EUPL-1.2

{
  description = "PEC POO 2025";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let

      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {

            pkgs = import nixpkgs { inherit system; };

          }
        );

    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = import ./nix/shell.nix { inherit pkgs self; };
        }
      );

      checks = forEachSupportedSystem (
        # pkgs: #import ./nix/pre-commit-checks.nix { inherit pkgs inputs; }
        { pkgs }:
        {
          chcks = inputs.pre-commit-hooks.lib.${pkgs.system}.run {
            src = ./.;

            hooks = {
              deadnix.enable = true;
              statix.enable = true;
              flake-checker.enable = true;

              reuse.enable = true;
              markdownlint.enable = true;
            };
          };
        }
      );
    };
}
