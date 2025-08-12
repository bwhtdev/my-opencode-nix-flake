with import <nixpkgs> {};
mkShell {
  buildInputs = [ nodejs_20 ];
  shellHook = ''
    npm i opencode-ai@latest
    alias opencode="npx opencode-ai"
    echo "Run 'opencode' to start the agentic environment."
  '';
}
