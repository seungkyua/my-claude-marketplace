# 코드 생성 계획 — 익명 피드백 시스템

## 프로젝트 정보
- **프로젝트명**: anonymous-feedback
- **코드 위치**: `src/`
- **기술 스택**: TypeScript + Vitest
- **TDD 적용**: Red → Green → Refactor

## ���드 생성 순서

### Phase 1: 프로젝트 구조 및 기반

- [x] Step 1: 프로젝트 초기화 — package.json, tsconfig, eslint, prettier, vitest 설정
- [x] Step 2: 폴더 구조 생성 — sdd.md 기반 디렉토리 트리 생성

### Phase 2: 데이터베이스 및 공통 유틸리티 (src/lib/)

- [x] Step 3: Prisma 스키마 구현 — Feedback, Category 모델, 마이그레이션
- [x] Step 4: 공통 에러 처리 구현 — RFC 7807 Problem Details, AppError 클래스
- [ ] Step 5: 입력 검증 유틸리티 구현 — sanitizeInput, validateFeedback

### Phase 3: 핵심 비즈니스 로직 (src/services/)

- [ ] Step 6: 피드백 생성 서비스 구현 — createFeedback, 익명성 보장, 카테고리 분류
- [ ] Step 7: 피드백 조회 서비스 구현 — listFeedbacks, getFeedbackById, 페이지네이션
- [ ] Step 8: 위험 키워드 감지 구현 — detectDangerousKeywords, 알림 트리거

### Phase 4: API 엔드포인트 (src/app/api/)

- [ ] Step 9: POST /api/feedbacks 구현 — 피드백 생성 엔드포인트, 입력 검증
- [ ] Step 10: GET /api/feedbacks 구현 — 피드백 목록 조회, 필터링, 페이지네이션
- [ ] Step 11: GET /api/feedbacks/[id] 구현 — 피드백 상세 조회

### Phase 5: 프론트엔드 UI (src/components/)

- [ ] Step 12: 피드백 작성 폼 구현 — FeedbackForm 컴포넌트, 카테고리 선택, 제출
- [ ] Step 13: 피드백 목록 화면 구현 — FeedbackList, FeedbackCard, 무한 스크롤
- [ ] Step 14: 대시보드 구현 — 통계 요약, 카테고리별 차트

## 스토리 매핑

| 기능 요구사항 | 구현 Step |
|--------------|----------|
| 익명 피드백 작성 | Step 5-6, 9, 12 |
| 피드백 목록 조회 | Step 7, 10, 13 |
| 피드백 상세 조회 | Step 7, 11 |
| 위험 키워드 감지 | Step 8 |
| 관리 대시보드 | Step 14 |
| 에러 처리 (RFC 7807) | Step 4 |
| 입력 검증/XSS 방어 | Step 5, 9 |
