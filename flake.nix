{
  description = "OpenRiichi: An open source riichi mahjong client";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        open-richii = pkgs.callPackage ./open-richii.nix { };
        default = self.packages.${system}.open-richii;
      };
    };
}
