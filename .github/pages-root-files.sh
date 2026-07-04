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

if [ -f "$pages_root"/404.html ]; then
  sed -i \
    -e 's#href="/assets/#href="/mesbg2024/assets/#g' \
    -e 's#src="/assets/#src="/mesbg2024/assets/#g' \
    -e 's#href="/stylesheets/#href="/mesbg2024/stylesheets/#g' \
    -e 's#src="/stylesheets/#src="/mesbg2024/stylesheets/#g' \
    -e 's#href="/\."#href="/mesbg2024/"#g' \
    -e 's#new URL("/",location)#new URL("/mesbg2024/",location)#g' \
    "$pages_root"/404.html

  for page_root in quick_start rules_manual matched_play_guide battle_companies forces_of_good forces_of_evil legendary_legions campaigns scenarios; do
    sed -i "s#href=\"/$page_root/#href=\"/mesbg2024/$page_root/#g" "$pages_root"/404.html
  done
fi
