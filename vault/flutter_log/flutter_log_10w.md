# 10w

## [login_page](../../lib/ui/pages/login/login_page.dart) 완성

### login api 설정
[api_services](../../lib/services/api_services.dart)

- login api - post request
```dart
POST https://daelim.fleecy.dev/function/v1/students/login
{
    "email":"",
    "password":"",
}
```
- login api - response
```json
{
    "data": {
        "name": "",
        "token_type": "",
        "access_token": "", // base64
        "refresh_token": "", // 이건 잘 안줌 - 해킹당하면 끝
        "expires_at": 1778136284,
        "expires_in": 3600,
    }
}
```

## data class 생성
```dart
class AuthData {
  final String name;
  final String tokenType;
  final String accessToken;
  final String refreshToken;
  final int expiresAt;
  final int expiresIn;
}
```
[auth_data](../../lib/models/auth_data.dart)
- VSC extention `Dart Data Class Generator` 설치
-> 껐다 키면 사용 가능

변수명 물결치는 부분 잡고 전구 누르면 data class 제작 가능함

근데 변수명 기준이라서 진짜 키값으로 바꿔줘야함

(애초에 제대로 매핑 따로 해주는것도 가능한 영역임. 내 영역에서와 받은 영역에서의 키가 일치할거라는 보장이 없음)

진짜 쉽게 생각하면 어차피 JSON 형식의 data 다룰거면 map이 편하니가 그걸 기반으로 data 입출력용 관련 코드들 만들어주는 확장 프로그램인듯



## [home_page](../../lib/ui/pages/home/home_page.dart) 제작
> 가장 밖에 존재하는 페이지는 STL이어야한다.
- 당연히 바로 router에 등록해준다
    - [app_page](../../lib/app/router/app_page.dart)의 enum에 등록하고 하면 된다




---


```dart
debugShowCheckedModeBanner: false
```
디버그 모드에서 디버그 표기 지우는 옵션 - 어지간하면 쓸 이유가 없다는게 함정


---

안드로이드 네이티브 ai 활용해서 잘 쓰고 있다면
안드로이드 CLI 한번 알아봐라
