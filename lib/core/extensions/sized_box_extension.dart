import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget get widthBox => SizedBox(
    width: toDouble(),
  );
  Widget get heightBox => SizedBox(
    height: toDouble(),
  );
}