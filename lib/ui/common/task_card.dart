import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';
import 'package:unitask/ui/common/subject_label.dart';

@AppThemePreview(
  group: 'Button',
  name: 'TaskCard',
)
Widget TaskCardPreview() => Wrap(
  spacing: 10,
  runSpacing: 10,
  children: [
    TaskCard(category: SubjectLabel(text:'전체'), title: 'title', date: DateTime.now(),),
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
    final dDay = date.difference(DateTime.now()).inDays;
    final dDayColor = switch (dDay) {
      <= 3 => Colors.red, // 3d left
      <= 7 => Colors.orange, // 7d left
      _ => Colors.black, // default
    };

    return Card(
      child: Container(
        height: 120,
        padding: const .symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .spaceBetween,
          children: [
            // 과목 라벨 / 체크박스
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                category,
                Checkbox(
                  value: checked,
                  onChanged: onchecked,
                  visualDensity: .compact,
                  fillColor: .resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? Colors.blue
                    : Color(0xFFF3F4F6)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(5),
                  ),
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                  materialTapTargetSize: .shrinkWrap,
                ),
              ],
            ),
            // 타이틀
            Text(
              title,
              maxLines: 1,
              overflow: .ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: .bold,
              ),
            ),
            // 기한 표시
            Row(
              children: [
                Icon(
                  LucideIcons.calendarRange,
                  size: 12,
                  color: dDayColor,
                ),
                Text(
                  DateFormat('yyyy.MM.dd').format(date),
                  style: TextStyle(
                    fontSize: 10,
                    color: dDayColor,
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}