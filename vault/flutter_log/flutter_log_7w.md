# 7W

## 제작하기
### 로그인 페이지 마무리?
- 로그인 페이지
[LoginPage](../lib/ui/pages/login/login_page.dart)

obscureText 설정 가능하게 수정 후 비밀번호 입력란에 적용

비밀번호인 경우 ( obscureText == true )
suffixIcon (eye) 표기되도록, 클릭시 비밀번호 보일 수 있게 stf 및 event 동작 함수 추가

비밀번호를 잊으셨나요에 snackbar 이벤트 추가

### 회원가입 페이지 제작
[SignupPage](../lib/ui/pages/signup/signup_page.dart)

goNamed가 아니라 pushNamed로 자동으로 뒤로가기 생성될 수 있게 함


#### 라우터 수정
라우터에 GoRouter를 하나하나 추가하지 않기 위해 구조 수정도 함

### data io를 위한 뭔가 추가
```yaml
shared_preferences: ^2.5.5
```

---
#### 중간고사용 앱 빌드 및 제출하기

```shell
flutter build apk --release --split-per-abi
# 지정된 apk file 위치 이동 (밖으로)
flutter clean # 이후 압축해서 제출
```

