let
  pkgs = import <nixpkgs> {};

  hask-env = pkgs.haskellPackages.ghcWithPackages (h: with h; [
    parsec system-filepath turtle xmonad xmonad-contrib xmonad-extras
  ]);
in pkgs.stdenv.mkDerivation {
  name = "xmonad-env";
  src = ./.;
  buildInputs = [ hask-env ];
  buildPhase = ''
    ${hask-env}/bin/ghc -ilib/ init2.hs xmonad.hs
  '';
  installPhase = "";
}
