{
  description = "Opencode";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "opencode";
        src = self;
        buildInputs = with pkgs; [ nodejs_20 ];
        nativeBuildInputs = with pkgs; [ makeWrapper ];
        installPhase = ''
          mkdir -p $out/bin $out/share/opencode
          cp -r ${self}/* $out/share/opencode
          cp $out/share/opencode/run.sh $out/bin/opencode
          chmod +x $out/bin/opencode
          wrapProgram $out/bin/opencode \
            --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.nodejs_20 ]}
        '';
      };

      defaultPackage.${system} = self.packages.${system}.default;
    };
}
