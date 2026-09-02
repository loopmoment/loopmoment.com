# loopmoment.com

loopmoment 팀과 서비스를 소개하는 정적 웹사이트입니다.

## 로컬에서 보기

```bash
npm run dev
```

브라우저에서 `http://localhost:8000`을 엽니다.

## GitHub Pages 배포

1. GitHub 저장소의 **Settings → Pages → Build and deployment**에서 Source를 **GitHub Actions**로 설정합니다.
2. 변경 사항을 `main` 브랜치에 커밋합니다.
3. 아래 명령으로 배포합니다.

```bash
npm run deploy
```

`main` 브랜치에 push되면 `.github/workflows/pages.yml`이 사이트를 자동 배포합니다.

커스텀 도메인은 `CNAME`에 `loopmoment.com`으로 설정되어 있습니다. DNS 제공업체에서 GitHub Pages용 레코드도 설정해야 합니다.
