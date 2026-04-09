# 6W

새로운 프로젝트 진행

6개의 화면이 만들어질 예정
- 로그인
- 회원가입
- 내 과제
- 새 과제 추가
- 달력?

## init project
```powershell
flutter create --org kr.ac.daelim unitask
# unitask 프로젝트 디렉토리 생성됨 -> 나는 .으로 수정
```

- 도구 추가 [pubspec.yaml](../pubspec.yaml)
```yaml
dependencies:
  go_router: ^17.2.0
  provider: ^6.1.5+1
  lucide_icons_flutter: ^3.1.12
```

## 제작하기
### 설정
- 프로젝트 소스코드 정리를 위한 dir 생성 및 정리

- 테마 관리를 위한 class작성
[theme](app_theme.dart)

### 로그인 페이지 제작
- 로그인 페이지 제작
[LoginPage](../lib/ui/pages/login/login_page.dart)

- sizebox를 위한 size extension 제작
[SizedBoxExtention](../lib/app/extensions/sized_bod_extension.dart)


- 재사용을 위한
[LabelTextField](../lib/ui/common/label_text_field.dart)

- 재사용을 위한 text divider 제작
[TextDivider](../lib/ui/common/text_divider.dart)


### router
- GoRouter를 기반으로 라우터 제작
[AppRouter](../lib/app/router/app_router.dart)
- main.dart에서 router를 기반으로 작동하도록 수정
[Main](../lib/main.dart)
- 앱 내부 경로 관리를 위한 emum 생성
[AppPage](../lib/app/router/app_page.dart)

---

SPA 기반이던 ft_transcendence에서 보던 라우터 또보네
