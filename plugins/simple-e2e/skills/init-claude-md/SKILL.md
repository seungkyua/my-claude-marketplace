---
name: init-claude-md
description: >
  현재 작업 디렉토리에 CLAUDE.md 파일을 초기화합니다. 이 skill은 플러그인에 번들된
  CLAUDE.md 템플릿을 현재 디렉토리로 복사합니다. 사용자가 "CLAUDE.md 초기화",
  "CLAUDE.md 복사", "프로젝트 설정", "init claude", "copy claude.md" 등을 요청할 때
  반드시 이 skill을 사용하세요.
---

# init-claude-md Skill

현재 디렉토리에 `CLAUDE.md` 파일을 생성(복사)합니다.
이 skill에 번들된 `assets/CLAUDE.md` 템플릿을 사용합니다.

## 실행 방법

### 방법 1: 스크립트 직접 실행

```bash
bash .claude/skills/init-claude-md/scripts/copy-claude-md.sh
```

### 방법 2: 슬래시 커맨드 사용

Claude Code 세션에서:
```
/init-claude-md
```

## 동작 방식

1. 이 skill의 `assets/CLAUDE.md`를 현재 작업 디렉토리로 복사합니다.
2. 이미 `CLAUDE.md`가 존재하면 덮어쓸지 확인합니다.
3. 복사 완료 후 경로를 출력합니다.

## Claude에게 지시

이 skill이 트리거되면 아래 bash 명령어를 실행하세요:

```bash
bash "$(find ~/.claude/skills /home/*/.claude/skills .claude/skills -name copy-claude-md.sh 2>/dev/null | head -1)"
```

또는 스크립트 경로를 직접 지정해서 실행:

```bash
SKILL_SCRIPTS_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]:-$0}")")/scripts"
bash "$SKILL_SCRIPTS_DIR/copy-claude-md.sh"
```

스크립트를 찾지 못하면 `assets/CLAUDE.md` 내용을 직접 현재 디렉토리의 `CLAUDE.md`로 작성하세요.
(assets/CLAUDE.md 파일을 먼저 read tool로 읽어 내용을 확인하세요.)