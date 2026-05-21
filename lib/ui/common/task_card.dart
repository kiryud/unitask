import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(
  group: 'Button',
  name: 'TaskCard',
)
Widget TaskCardPreview() => Wrap(
  spacing: 10,
  runSpacing: 10,
  children: [
    TaskCard(category: Text('전체'), title: 'title', date: DateTime.now(),),
    TaskCard(category: Text('진행중'), title: 'title', date: DateTime.now(),),
    TaskCard(category: Text('완료'), title: 'title', date: DateTime.now(),),
  ],
);

class TaskCard extends StatelessWidget {
  final bool checked;
  final String title;
  final DateTime date;
  final VoidCallback? onSelected;
  final Function(bool? value)? onchecked;
  final Widget category;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.category,
    this.checked = false,
    this.onSelected,
    this.onchecked,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              category,
              Checkbox(
                value: checked,
                onChanged: onchecked
              ),
            ],
          ),
          Text(title),
          Row(
            children: [
              Icon(LucideIcons.calendar),
              // TODO: 아이콘 색상 설정은 아래와 같음
              // =< D-3 : red
              // =< D-7 : orange
              // > D-7 : black
              // complete : grey
              Text(
                'datetime',
                // TODO: DateTime 사용, intl을 통해 서식 계산
                ),
            ]
          ),
        ],
      ),
    );
  }
}