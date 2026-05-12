# flutter scaffold framework

> android material design scaffold framework

## Scaffold
- Material style

### structure
- appBar
- body
- drawer
- bottomNavigationBar
- floatingActionButten
- snackBar
- bottomSheet

#### appBar
- safeArea처리
- 높이
- 그림자
- 뒤로 가기
- padding
- 아이콘 spacing

```dart
appBar: AppBar(
  title: Text('appBar Title'),
)
```

#### floatingActionButton

```dart
floatingActionButton: FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
),
```

#### bottomNavigationBar

```dart
bottomNavigationBar: BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '홈',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '프로필',
    ),
  ],
),
```

#### drawer

- left side
```dart
drawer: Drawer(
    child: ListView(
        children: [
            DrawerHeader(child: Text('좌측 메뉴'),),
            ListTile(title: Text('메뉴1')),
            ListTile(title: Text('메뉴2')),
        ],
    ),
)
```

- right side
```dart
endDrawer: Drawer(
    child: ListView(
        children: [
            DrawerHeader(child: Text('우측 메뉴'),),
            ListTile(title: Text('메뉴1')),
            ListTile(title: Text('메뉴2')),
        ],
    ),
)
```

### tools
- safeArea
