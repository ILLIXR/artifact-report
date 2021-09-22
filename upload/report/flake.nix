{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        name = "document";
      in
      {
        packages.${name} = pkgs.stdenv.mkDerivation {
          inherit name;
          src = ./.;
          builder = ./builder.sh;
          buildInputs = [
            pkgs.which
            pkgs.python39Packages.pygments
            (
              pkgs.texlive.combine {
                inherit (pkgs.texlive)
                  scheme-basic
                  comment
                  xkeyval
                  times
                  xcolor
                  minted
                  fvextra
                  etoolbox
                  fancyvrb
                  upquote
                  lineno
                  catchfile
                  xstring
                  framed
                  float
                  metafont
                ;
              }
            )
          ];
        };
        defaultPackage = self.packages.${system}.${name};
      });
}
