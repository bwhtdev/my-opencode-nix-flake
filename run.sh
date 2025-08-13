#/usr/bin/env bash

npm ci --prefix $(pwd)
npm i
npx opencode-ai
