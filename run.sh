#/usr/bin/env bash

cd "$(dirname "$0")/../share/opencode"
npm i
npx opencode-ai
