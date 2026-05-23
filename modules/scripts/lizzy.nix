{
  pkgs,
  inputs,
  ...
}: let
  naersk = pkgs.callPackage inputs.naersk {};
in
  naersk.buildPackage {
    src = pkgs.fetchFromGitHub {
      owner = "stefur";
      repo = "lizzy";
      rev = "f9f77e60bebb125913380b56b5987dbf48838e17";
      hash = "sha256-bq1CmjMbClflzEm2MwWHzlV3XqJh/YYqe2bkcj5mF1s=";
    };
    pname = "lizzy";
    version = "git";
  }
