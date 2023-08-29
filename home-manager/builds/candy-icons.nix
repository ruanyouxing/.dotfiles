{stdenv,fetchFromGitHub,...}:
  stdenv.mkDerivation {
    name = "candy-icons";
    src = fetchFromGitHub {
      owner = "EliverLara";
      repo = "candy-icons";
      rev = "f7f19a1fa167d7799682f4f9fb2249271fc8efa8";
      hash = "sha256-g+0eTweLsPG4g7X0wOuNFzjZug8R+vnhO6VBnAu/Yzw=";
    };
    installPhase = ''
    mkdir -p $out/share/icons/candy-icons
    cp -r $src/* $out/share/icons/candy-icons
    '';
  }
