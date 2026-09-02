#!/usr/bin/env bash

set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"

if [[ -z "$repo_root" ]]; then
  echo "오류: Git 저장소 안에서 실행해 주세요." >&2
  exit 1
fi

cd "$repo_root"

if [[ -n "$(git status --porcelain)" ]]; then
  echo "오류: 커밋하지 않은 변경 사항이 있습니다. 먼저 커밋해 주세요." >&2
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "오류: origin 원격 저장소가 설정되어 있지 않습니다." >&2
  exit 1
fi

branch="$(git branch --show-current)"

if [[ "$branch" != "main" ]]; then
  echo "오류: main 브랜치에서 실행해 주세요. 현재 브랜치: $branch" >&2
  exit 1
fi

echo "main 브랜치를 origin에 올립니다. 완료되면 GitHub Actions가 Pages를 배포합니다."
git push origin main
echo "배포 요청이 완료되었습니다. GitHub 저장소의 Actions 탭에서 진행 상태를 확인하세요."
