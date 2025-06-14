{ lib, ... }:

let
  getAllFiles = dir:
    let
      content = builtins.readDir dir;
      files =
        builtins.concatMap (name:
          let
            fullPath = dir + "/${name}";
          in
            if content.${name} == "regular" then [ fullPath ]
            else if content.${name} == "directory" then getAllFiles fullPath
            else []
        ) (builtins.attrNames content);
    in files;

  configFiles = getAllFiles ../.config;

  mkConfigEntry = path: let
    relPath = lib.removePrefix (toString ../.config + "/") (toString path);
  in {
    name = ".config/${relPath}";
    value = {
      source = path;
      force = true;
    };
  };

  configLinks = builtins.listToAttrs (map mkConfigEntry configFiles);
in {
  home.file = configLinks;
}
