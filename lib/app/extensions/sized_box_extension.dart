import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget get widthBox => SizedBox(
    width: this.toDouble(),
  );
  Widget get heightBox => SizedBox(
    height: this.toDouble(),
  );
}