#!/usr/bin/env sh
set -eu

pages_root="gh-pages"
default_version="mesbg2024"

mkdir -p "$pages_root"

for pattern in CNAME google*.html yandex*.html; do
  for source_file in overrides/$pattern; do
    if [ -f "$source_file" ]; then
      cp "$source_file" "$pages_root"/
    fi
  done
done

for root_file in overrides/robots.txt "$pages_root/$default_version/404.html"; do
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
