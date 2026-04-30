import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/extensions/snackbar_extension.dart';
import 'package:unitask/app/router/app_page.dart';
import 'package:unitask/ui/common/label_text_field.dart';
import 'package:unitask/app/extensions/sized_box_extension.dart';
import 'package:unitask/ui/common/text_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(20),
                    color: Color(0xFF3B82F6),
                  ),
                  width: 100,
                  height: 100,
                  child: Icon(
                    size: 50,
                    LucideIcons.graduationCap
                    ),
                ),
                Text(
                  'UniTask',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: .bold,
                  ),
                ),
                Text('과제 관리를 스마트하게'),
                50.heightBox,
                LabelTextField(
                  label: "이메일",
                  hintText: 'example@university.edu', 
                  icon: LucideIcons.mail
                ),
                20.heightBox,
                LabelTextField(
                  label: "비밀번호",
                  hintText: '************',
                  icon: LucideIcons.lockKeyhole,
                  enableObscure: true,
                ),
                Align(
                  alignment: .centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.showSnackBar('곧 기능을 출시합니다!');
                    },
                    child: const Text(
                      '비밀번호를 잊으셨나요?'
                    )
                  ),
                ),
                20.heightBox,
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('로그인 버튼 눌림');
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontWeight: .bold,
                        fontSize: 18
                      ),
                    )
                  ),
                ),
                20.heightBox,
                TextDivider(
                  text:'또는'
                ),
                20.heightBox,
                Center(
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      const Text('계정이 없으신가요?'),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(AppPage.signup.name);
                        },
                        child: const Text('회원가입')
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}