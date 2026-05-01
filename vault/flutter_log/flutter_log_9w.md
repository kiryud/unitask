# 7W

## 제작하기
### signup 페이지 제작
- 회원가입을 위한 검증 및 api 요청 제작

##### 분기문 정리
한 함수 내에서의 분기문은 여러 방식으로 작성 가능함
> else if forest
```dart
if (true) {}
else if (true) {}
else {}
return ;
```

> only if
- 요걸로 진행
```dart
if (true) return ;
if (true) return ;
if (true) return ;
```

> switch
```dart
switch (boolean) {
  case true:
    break;
  case false:
    return ;
  default:
}
```

> switch expression (router/app_page.dart에서 씀)
```dart
var result = switch (boolean) {
  true => true,
  false => false,
  _ => null,
};
```

> 삼항연산자
```dart
true ? {} : return ;
```

> `??` if-null
```dart
String? name;
name ?? 'hello';
```

#### 코루틴
- async라고 이 메서드는 비동기 메서드다라고 선언하고 내부에서 그 상황마다 await 해주는 것임
```dart
Future<void> httpRequestSomething() async {
  // 1. 요청을 보냄 (응답 올 때까지 이 함수만 잠시 중단)
  var response = await http.get(Uri.parse(_someUri)); 
  debugPrint('Response [$statusCode] : ${response.body}');
}
```
- 여기선 멱등성 보장을 위해 방지해주는 코드를 넣어야함
```dart
child: ElevatedButton(
  onPressed: _loading
    ? null
    : _onSignup,
  child: _loading 
  ? const SizedBox.square(
    dimension: 30,
    child: CircularProgressIndicator(
      color: Colors.white,
      year2023: false,
    ),
  )
  : const Text(
    '계정 만들기',
    style: TextStyle(
      fontWeight: .bold,
      fontSize: 20,
    ),
  )
),
```


##### vthread
- 버추얼 스레드(자바에서만 있고 JVM이 관리하는 애)는 아니라고 한다
- 애초에 스레드 분리조차 아니고 잠깐 자리 비켜주는 것임
- 당연하지만 datarace를 방지하기 위해 조작 필요
- HTTP request 이기 때문에 비동기로 작업해야하고 (file I/O도 그게 더 안전함)



### API 사용해보기
> 교수님이 제공하는 서버에 URI를 통해 접근 (HTTP 프로토콜, Rest api 중 Post 활용)
```
https://daelim-api.fleecy.dev/
flutter
```

#### api 서버에 접근 가능한 앱 설정

- android 내부의 AndroidManifest.xml을 찾아 권한 설정을 해준다
  - application이랑 같은 레벨이다.
  - a만 기억나서 액티비티인줄
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

- 참고로 application의 label이 앱 이름으로 보이고 아이콘이 아이콘으로서 보인다.
  - name은 딱 봐도 건들거면 저 변수가 어디서 선언되었고 초기화되었길래 사용되는지 알아와야겠네
```xml
<application
        android:label="UniTask"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
```

- 가입에서 API를 통해 데이터를 전송하고 결과를 받을 메서드 제작
http api [`post`](../lib/services/api_services.dart)

- 비동기 처리


### 로그인 페이지 수정
- 로그인 페이지 하단 키보드 올라왔을때 오버플로우 나오는 부분 수정
[LoginPage](../lib/ui/pages/login/login_page.dart)






---

- http 프로토콜 보내보기
  - mac netcat 쓸 수 있었을라나

- Thunder Client 설치 (VSC extention)
무료로 안된다 삭제 ㄱㄱ

- postman 가입했는디 바뀜

- REST Client (VSC extention) 설치한다~~
  - api/유저관리.http 제작
    - 대충 교수님 서버 URI로 접근 가능한지 테스트 해본거임

flutter는 RequestMapping(spring)같은거 공식적으로는 없다고 함

- http 내장 라이브러리 가져와 쓰기
```pubspec.yaml
dependencies:
  # Core
  http:
```
다른 라이브러리가 호출할 수 있기에 버전을 비워둔다.





