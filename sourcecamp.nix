with import <nixpkgs> {};

mkShell {
  buildInputs = [
    go
    nodejs_20  # For pnpm and frontend tools
    pnpm
    postgresql
    docker
    redis
    #rabbitmq
    # Add other packages as needed, e.g., for Plush, Vite, etc., if available in nixpkgs
  ];
  shellHook = ''
    export PATH=$PATH:$(pwd)/src/backend:$(pwd)/src/frontend/node_modules/.bin
    cd src/backend && go mod init github.com/bwhtdev/sourcecamp/src/backend
    cd ../../src/frontend && pnpm i
    cd ../..
    echo "Nix shell for SourceCamp is ready. Run 'go' commands in backend or 'pnpm' in frontend."
  '';
}
