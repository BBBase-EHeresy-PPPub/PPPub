#!/usr/bin/env sh
set -eu

source_root="${1:-docs/mesbg2018}"
pages_root="${2:-gh-pages}"

mkdir -p "$pages_root"

for pattern in CNAME google*.html yandex*.html; do
  for source_file in "$source_root"/$pattern; do
    if [ -f "$source_file" ]; then
      cp "$source_file" "$pages_root"/
    fi
  done
done

for root_file in overrides/robots.txt overrides/sitemap.xml "$pages_root"/mesbg2024/404.html; do
  if [ -f "$root_file" ]; then
    cp "$root_file" "$pages_root"/
  fi
done
