# SPDX-FileCopyrightText: 2025 Lucas Carratalá Del Toro <lcarratal7@alumno.uned.es>
#
# SPDX-License-Identifier: EUPL-1.2

{ pkgs, self }:

pkgs.mkShellNoCC {
  name = "pecPooDevShell";

  strictDeps = true;

  inherit (self.checks.${pkgs.system}.chcks) shellHook;
  buildInputs = self.checks.${pkgs.system}.chcks.enabledPackages;

  nativeBuildInputs = builtins.attrValues {
    inherit (pkgs)
      typst
      typstyle
      tinymist
      jdt-language-server
      ;
  } ++ self.checks.${pkgs.system}.chcks.enabledPackages;
}
