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
          npm i opencode-ai@latest
          mkdir -p $out/bin
          cp ${self}/run.sh $out/bin/opencode
          chmod +x $out/bin/opencode
          wrapProgram $out/bin/opencode \
            --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.nodejs_20 ]}
        '';
      };

      defaultPackage.${system} = self.packages.${system}.default;
    };
}
