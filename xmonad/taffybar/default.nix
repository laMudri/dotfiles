let
  pkgs = import <nixpkgs> {};

  hask-env =
    pkgs.haskellPackages.ghcWithPackages (h: with h; [ taffybar text ]);
in pkgs.stdenv.mkDerivation {
  name = "taffybar-env";
  src = ./.;
  buildInputs = [ hask-env ];
  buildPhase = ''
    ${hask-env}/bin/ghc taffybar.hs
    ./taffybar
  '';
  installPhase = "";
}
