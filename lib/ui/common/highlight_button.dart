import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(
  group: 'Button',
  name: 'HighlightButton',
)
Widget HighlightButtonPreview() => const Wrap(
  spacing: 10,
  runSpacing: 10,
  children: [
    HighlightButton(child: Text('전체'), color: Colors.deepPurple, leading: Icon(LucideIcons.plus), trailing: Icon(LucideIcons.smile),),
    HighlightButton(child: Text('진행중')),
    HighlightButton(child: Text('완료')),
  ],
);

class HighlightButton extends StatelessWidget {
  final Color color;
  final double spacing;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const HighlightButton({
    super.key,
    this.color = Colors.blue,
    this.spacing = 10.0,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: .symmetric(
          vertical: 5,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          border: .all(color: color, width: 2),
          borderRadius: .circular(10),
          color: color.withValues(alpha: 0.3),
        ),
        alignment: .center,
        child: Row(
          spacing: spacing,
          mainAxisSize: .min,
          children: [
            if (leading != null && leading is Icon)
              Icon(
                (leading as Icon).icon,
                color: (leading as Icon).color ?? color,
                size: (leading as Icon).size,
              )
            else
              ?leading ,
            DefaultTextStyle(
              style: TextStyle(
                color: color,
                fontWeight: .bold,
              ),
              child: child),
            if (trailing != null && trailing is Icon)
              () {
                final trailingIcon = trailing as Icon;
                return Icon(
                  trailingIcon.icon,
                  color: trailingIcon.color ?? color,
                  size: trailingIcon.size,
                );
              }()
            else
              ?trailing ,
          ],
        ),
      ),
    );
  }
}