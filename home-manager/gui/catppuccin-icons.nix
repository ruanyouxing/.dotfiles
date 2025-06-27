{
  fetchFromGitHub,
  runCommand,
  ...
}:
let
  src = fetchFromGitHub {
    "owner" = "Fausto-Korpsvart";
    "repo" = "Catppuccin-GTK-Theme";
    "rev" = "c961826d027ed93fae12a9a309616e36d140e6b9";
    "hash" = "sha256-7F4FrhM+kBFPeLp2mjmYkoDiF9iKDUkC27LUBuFyz7g=";
  };
in
runCommand "catppuccin-icons" { inherit src; } ''
  mkdir -p $out/share/icons
  cp -r $src/icons/* $out/share/icons
''
