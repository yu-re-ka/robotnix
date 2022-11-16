# SPDX-FileCopyrightText: 2021 Daniel Fullmer and robotnix contributors
# SPDX-License-Identifier: MIT

{ config, pkgs, lib, ... }:

let
  inherit (lib) mkIf;
in
mkIf (config.androidVersion == 13) {
  source.dirs."build/make".patches = [
    ./build_make/0001-Readonly-source-fix.patch
    #./build_make/0003-Add-option-to-include-prebuilt-images-when-signing-t.patch # Moved temporarily to modules/pixel/driver-binaries.nix
  ];
  source.dirs."packages/modules/Virtualization".patches = [
    ./virtualization-readonly-source.diff
  ];

  #kernel.clangVersion = mkDefault "r370808";
}
