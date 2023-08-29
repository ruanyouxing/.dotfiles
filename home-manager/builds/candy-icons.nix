{stdenv,fetchFromGitHub,...}:
  stdenv.mkDerivation {
    name = "candy-icons";
    src = fetchFromGitHub {
      owner = "EliverLara";
      repo = "candy-icons";
      # repo = "Sweet-folders";
      # rev = "b2192ff1412472f036fdf9778c6b9dbcb6c044ec";
      # hash = "sha256-QexfqXH5a1IEhKBRjWSMdrEvThvLRzd4M32Xti1DCGE=";
      rev = "f7f19a1fa167d7799682f4f9fb2249271fc8efa8";
      hash = "sha256-g+0eTweLsPG4g7X0wOuNFzjZug8R+vnhO6VBnAu/Yzw=";
    };
    installPhase = ''
    mkdir -p $out/share/icons/candy-icons
    cp -r $src/* $out/share/icons/candy-icons
    '';
  }
