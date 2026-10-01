#!/bin/bash
# Pushes the student site to BOTH accounts.
# They need separate credentials, so we switch gh accounts between pushes.
set -e
cd "$(dirname "$0")"
was=$(gh api user --jq .login)

gh auth switch --user classtapacademy >/dev/null
git push backup main
echo "  -> classtapacademy ok"

gh auth switch --user sharath-tap >/dev/null
git push origin main
echo "  -> sharath-tap ok"

gh auth switch --user "$was" >/dev/null
echo "done. both copies updated."
