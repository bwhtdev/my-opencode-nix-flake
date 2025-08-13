{
  description = "SourceCamp development environment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";  # Adjust as needed
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShell.${system} = pkgs.mkShell {
      buildInputs = with pkgs; [ go nodejs_20 postgresql docker redis rabbitmq-c rabbitmq-server ];
      shellHook = ''
        export PATH=$PATH:$(pwd)/src/backend:$(pwd)/src/frontend/node_modules/.bin
        echo "Nix flake for SourceCamp is ready."
      '';
    };
  };
}
