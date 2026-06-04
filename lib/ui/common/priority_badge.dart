import 'package:flutter/material.dart';
import 'package:unitask/core/enum/priority.dart';

class PriorityBadge extends StatelessWidget {
  final Priority priority;

  const PriorityBadge({
    super.key,
    required this.priority,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: priority.secondary,
        borderRadius: .circular(50),
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: .min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: .circle,
              color: priority.primary,
            ),
          ),
          Text(
            priority.title,
            style: TextStyle(
              color: priority.primary,
              fontSize: 12,
              fontWeight: .w700,
            ),
          ),
        ],
      ),
    );
  }
}