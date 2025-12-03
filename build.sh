#!/usr/bin/env bash
set -e
docker build -t ${1:-trend-app:latest} .
