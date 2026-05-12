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
          // child: Placeholder()
          // TODO: body
          // TODO: costom bottom navigation bar
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                width: .infinity,
                padding: .all(8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: .circular(20)
                ),
                child: Column(
                  children: [
                    Icon(
                      size: 30,
                      color: Colors.white,
                      LucideIcons.carrot
                    ),
                    Text('Row align'),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('left'),
                        Text('middle'),
                        Text('right'),
                      ],
                    )
                  ],
                ),
              ),
              Wrap(children: [
                Chip(label: Text('data +++++++++++++++++')),
                Chip(label: Text('data1')),
                Chip(label: Text('data2')),
                Chip(label: Text('data3')),
                Text('help'),
                Chip(label: Text('data4')),
                Chip(label: Text('data5')),
                Chip(label: Text('data6')),
                Text('help'),Text('help'),Text('help'),
                ]),
              Text('data'),
              TextField(
              ),
              Text('data'),
            ],
          )
        ),
      ),
    );
  }
}