import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/extensions/snackbar_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.showSnackBar('진짜 못나가요');
          return ;
        }
        context.showSnackBar('못나가요 $didPop | $result');
        didPop = true;
        return ;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '내 과제',
          ),
          actions: [IconButton(onPressed: () {},
            icon: Icon(
              LucideIcons.bell,
            ),
          )],
        ),
        body: SafeArea(
          child: Placeholder()
          // TODO: body
          // TODO: costom bottom navigation bar
        ),
      ),
    );
  }
}