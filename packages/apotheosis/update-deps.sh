#!/usr/bin/env nix-shell
#!nix-shell -i bash -p dotnet-sdk_9 git jq nuget-to-json

set -euo pipefail

REPO_URL="https://gitlab.com/noqn/apotheosis.git"
PROJECT_FILE="Gui/Gui.csproj"
OUTPUT_FILE="deps.json"
CLONE_DIR="apotheosis-src"

rm -rf ../$OUTPUT_FILE

git clone "$REPO_URL" "$CLONE_DIR"
cd "$CLONE_DIR"

export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet restore --packages out

nuget-to-json out > "temp.json"
# tacky but anything better is beyond my skill
jq 'map(select(.pname | test("Microsoft\\.(AspNetCore|NETCore)\\.App\\.Runtime") | not))' temp.json > ../$OUTPUT_FILE

cd ..
rm -rf "$CLONE_DIR"
