#!/bin/bash
cd "$(dirname "$0")" || exit 1
export MODEL="qwen3:0.6b"
export WEB_PORT="8080"
exec ./start.sh
