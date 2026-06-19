#!/bin/bash
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/opt/homebrew/bin"
if [[ -x "$SRCROOT/.btt/BTTInstrumentor" ]]; then
    "$SRCROOT/.btt/BTTInstrumentor" instrument "$SRCROOT" --non-interactive --verbose
elif [[ -x "$(command -v BTTInstrumentor)" ]]; then
    "$(command -v BTTInstrumentor)" instrument "$SRCROOT" --non-interactive --verbose
else
    exit 0
fi