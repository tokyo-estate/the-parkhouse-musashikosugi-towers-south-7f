#!/bin/bash
# index.html（日英中切替入り）から A4 の PDF 版を日英中で作り直す → pdf/S7F_{ja,en,zh}.pdf ＋ スマホ用ビューア pdf/view.html
# 日本語本文を直したら: _ザパークハウス武蔵小杉タワーズ_i18n/make_s7f.py を直す → python3 _ザパークハウス武蔵小杉タワーズ_i18n/apply_s7f.py → これ → _deploy.sh
set -e
cd "$(dirname "$0")"
python3 /Users/leetenki/AI_share/.claude/skills/property-site/scripts/make_pdf_brochure.py "$PWD" --name S7F
V=$(grep -o 'view.html?lang=ja&v=[0-9a-z]*' index.html | head -1 | sed 's/.*&//')
python3 _tools/make_viewer.py "$PWD" "$V"
ls -la pdf/*.pdf
