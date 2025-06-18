lib: let
  globToRegex = glob: let
    escape = s:
      builtins.replaceStrings ["." "+" "?" "^" "$" "(" ")" "[" "]" "{" "}" "|" "\\"]
      ["\\." "\\+" "\\?" "\\^" "\\$" "\\(" "\\)" "\\[" "\\]" "\\{" "\\}" "\\|" "\\\\"]
      s;
    converted = escape glob;
    regex =
      builtins.replaceStrings ["*" "?"]
      [".*" "."]
      converted;
  in
    "^" + regex + "$";
  matchGlob = pattern: str: let
    re = globToRegex pattern;
  in
    builtins.match re str != null;

  getAllFiles = dir: optionalArgs: let
    ignoredGlobs = optionalArgs.ignoredGlobs or [];
    content = builtins.readDir dir;

    isIgnored = name:
      builtins.any (
        glob:
          builtins.match ".*${glob}.*" name != null
      )
      ignoredGlobs;

    files = builtins.concatMap (
      name:
        if isIgnored name
        then []
        else let
          fullPath = dir + "/${name}";
        in
          if content.${name} == "regular"
          then [fullPath]
          else if content.${name} == "directory"
          then getAllFiles fullPath optionalArgs
          else []
    ) (builtins.attrNames content);
  in
    files;
  mkConfigEntry = rootPath: optionalArgs: let
    fileList = getAllFiles rootPath optionalArgs;
    pairs =
      map (
        val: let
          relPath = lib.removePrefix (toString rootPath + "/") (toString val);
        in {
          name = ".config/${relPath}";
          value = {
            source = val;
            force = true;
          };
        }
      )
      fileList;
  in
    pairs;

  genConfLinks = dir: optionalArgs: let
    path =
      if builtins.isList dir
      then dir
      else [dir];
  in
    builtins.listToAttrs (
      builtins.concatMap (path: mkConfigEntry path optionalArgs) path
    );
in {
  inherit getAllFiles matchGlob mkConfigEntry genConfLinks;
}
