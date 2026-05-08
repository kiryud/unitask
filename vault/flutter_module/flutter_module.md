# Flutter Module
> ai 쓸 생각이 없으면 배운걸 총정리해서 복붙과 수정으로 앱 제작 가능하게 정리해야지 뭐

> project root dir을 '/'로 표기하면서 진행할 예정

- flutter project 생성

- flutter package 설정
```yaml (/pubspec.yaml)
dependencies:
  flutter:
    sdk: flutter

  # Assets
  cupertino_icons: ^1.0.8
  lucide_icons_flutter: ^3.1.12

  # Core
  http: 
  go_router: ^17.2.0
  provider: ^6.1.5+1
  shared_preferences: ^2.5.5
```

### SPA 구조의 핵심 router 설정하기 (with gorouter)

- /lib/router/app_apge.dart
```dart
enum AppPage {
  login, signup, home
}

extension AppPageExtention on AppPage {
  String get path => '/$name';

  Widget get page => switch (this) {
    .login => const LoginPage(),
    .signup => const SignupPage(),
    .home => const HomePage(),
  };
}
```

- /lib/router/app_apge.dart

```dart
final appRouter = GoRouter(
  initialLocation: AppPage.login.path,
  routes: AppPage.values.map((e) {
    return GoRoute(
      name: e.name,
      path: e.path,
      builder: (context, state) => e.page,
    );
  }).toList(),
);
```

- /lib/main.dart

```dart
return MaterialApp.router(
    themeMode: .system,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    routerConfig: appRouter,
);
```
`.router`와 `routerConfig: appRouter`부분을 추가해준다

- 호출 방법

이동 (복귀 안함)
```dart
if (mounted) context.goNamed(AppPage.home.name);
```

이동 (복귀 필요)
```dart
context.pushNamed(AppPage.signup.name);

if (mounted) context.pop();
```

### app theme 설정하기

- /lib/theme/theme.dart

당연히 원하는 공통된 규격에 원하는 공통된 color를 엮어주면 된다

```dart
class AppTheme {
  static ThemeData get light => ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    brightness: .light,
    visualDensity: .adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontWeight: .bold,
        color: Colors.black,
        fontSize: 24,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF3B82F6),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF3B82F6),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF3B82F6),
        padding: const .symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: .circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF9FAFB),
      prefixIconColor: Color(0xFF9CA3AF),
      hintStyle: const TextStyle(
        color: Color(0xFF9CA3AF),
      ),
      border: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
```

- /lib/main.dart
```dart main.dart
return MaterialApp.router(
    themeMode: .system,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    routerConfig: appRouter,
);
```
`theme`이 들어간 부분을 추가해준다

### API 통신 클래스

- /lib/api/api_services.dart

```dart
import 'package:http/http.dart' as http;
import 'package:unitask/models/auth_data.dart';

class ApiService {
  static final String _hostUrl = 'https://daelim.fleecy.dev/functions/v1';
  static final String _signupUrl = "$_hostUrl/students/signup";

  static Future<bool?> signup({
    required String data,
  }) async {

    final response = await http.post(
      Uri.parse(_signupUrl),
      body: jsonEncode({
        "DATA": data,
      }),
    );
    final statusCode = response.statusCode;

    if (statusCode != 200) return false;

    return true;
  }
}
```

