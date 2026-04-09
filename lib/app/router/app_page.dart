enum AppPage {
  login,
}


extension AppPageExtention on AppPage {
  String get path => '/$name';
}