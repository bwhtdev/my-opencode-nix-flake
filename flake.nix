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
      packages.${system}.default = pkgs.buildNpmPackage {
        name = "opencode";
        src = self;
        npmDepsHash = "sha256-sGGz0+peviHWmv5UgN4uN7GrQyjFAoUO5//JkfuL1W8="; # Run `prefetch-npm-deps package-lock.json` once to get the real hash
        dontNpmBuild = true;
        installPhase = ''
          mkdir -p $out/bin
          cp -r $out/lib/node_modules/opencode-ai/bin/opencode $out/bin/opencode
          chmod +x $out/bin/opencode
          wrapProgram $out/bin/opencode \
            --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.nodejs_20 ]}
        '';
      };
    };
}
