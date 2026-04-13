#!/usr/bin/env bash
# copy-claude-md.sh
# 이 skill에 번들된 CLAUDE.md 템플릿을 현재 작업 디렉토리로 복사합니다.

set -euo pipefail

# ── 1. 스크립트 위치 기준으로 assets/CLAUDE.md 경로 결정 ──────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$SKILL_DIR/assets/CLAUDE.md"

# ── 2. 템플릿 파일 존재 확인 ───────────────────────────────────────────────
if [[ ! -f "$TEMPLATE" ]]; then
  echo "❌ 템플릿 파일을 찾을 수 없습니다: $TEMPLATE"
  exit 1
fi

# ── 3. 복사 대상 경로 결정 (인자로 지정 가능, 기본값: 현재 디렉토리) ────────
TARGET_DIR="${1:-$(pwd)}"
TARGET="$TARGET_DIR/CLAUDE.md"

# ── 4. 이미 존재하는 경우 덮어쓰기 여부 확인 ─────────────────────────────
if [[ -f "$TARGET" ]]; then
  echo "⚠️  CLAUDE.md 가 이미 존재합니다: $TARGET"
  read -rp "   덮어쓰시겠습니까? (y/N) " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "취소되었습니다."
    exit 0
  fi
fi

# ── 5. 복사 실행 ──────────────────────────────────────────────────────────
mkdir -p "$TARGET_DIR"
cp "$TEMPLATE" "$TARGET"
echo "✅ CLAUDE.md 복사 완료: $TARGET"
echo "   템플릿 출처: $TEMPLATE"