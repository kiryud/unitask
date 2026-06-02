import 'package:flutter/material.dart';

enum Priority { high, mid, low }

extension PriorityExtension on Priority {
  Color get primary => switch (this) {
    .high => Colors.red,
    .mid => Colors.amber,
    .low => Colors.green,
  };

  Color get secondary => switch (this) {
    .high => Color(0xFFFEE2E2),
    .mid => Color(0xFFFEF3C7),
    .low => Color(0xFFDCFCE7),
  };
  
  // i18n을 연결하면 됨
  String get title => switch (this) {
    .high => '높음',
    .mid => '중간',
    .low => '낮음',
  };
}