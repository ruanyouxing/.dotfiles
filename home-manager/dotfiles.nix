{
  config,
  lib,
  ...
}: let
  configDir = ../.config;
  configFiles = builtins.readDir configDir;
  configSymlinks =
    builtins.mapAttrs (name: _type: {
      source = "${configDir}/${name}";
    })
    configFiles;
  homeFileAttrs = builtins.listToAttrs (
    builtins.map (name: {
      name = "${config.home.homeDirectory}.config/${name}";
      value = configSymlinks.${name};
    }) (builtins.attrNames configSymlinks)
  );

  scriptsDir = ../scripts;
  scriptsFiles = builtins.readDir scriptsDir;

  filteredFiles =
    builtins.filter (name: scriptsFiles.${name} == "regular")
    (builtins.attrNames scriptsFiles);

  scriptsLinks = builtins.listToAttrs (builtins.map (name: {
      name = ".local/bin/${name}";
      value = {
        source = "${scriptsDir}/${name}";
        executable = true;
      };
    })
    filteredFiles);
in {
  home.file = homeFileAttrs // scriptsLinks;
  home.activation.ensureBin =
    lib.hm.dag.entryBefore ["linkGeneration"]
    ''
      mkdir -p "$HOME/.local/bin"
    '';
}
