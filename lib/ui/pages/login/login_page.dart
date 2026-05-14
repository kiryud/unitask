import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/core/extensions/build_context_extension.dart';
import 'package:unitask/app/router/app_page.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/features/auth/auth_provider.dart';
import 'package:unitask/models/auth_data.dart';
import 'package:unitask/services/auth_api_service.dart';
import 'package:unitask/ui/common/label_text_field.dart';
import 'package:unitask/core/extensions/sized_box_extension.dart';
import 'package:unitask/ui/common/text_divider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final TextEditingController _pwController = .new();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    final email = _emailController.text.trim();
    final password = _pwController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return context.showSnackBar(
        '이메일 또는 비밀번호를 입력해주세요',
        isError: true,
      );
    }

    final result = await ref
    .read(authApiServiceProvider)
    .login(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        if (mounted) context.goNamed(AppPage.home.name);
      case Failure(:final exception):
        if (mounted) {
          context.showSnackBar(
            exception.toString()
            ,isError: true
          );
        }
    };
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(authProvider).isLoading;
    
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
                    color: Colors.white,
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
                  controller: _emailController,
                  label: "이메일",
                  hintText: 'example@university.edu', 
                  icon: LucideIcons.mail
                ),
                20.heightBox,
                LabelTextField(
                  controller: _pwController,
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
                  child: ElevatedButton.icon(
                    icon: loading ? CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ) : null,
                    onPressed: loading
                    ? null
                    : _onLogin,
                    label: loading 
                    ? const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      year2023: false,
                      )
                    )
                    : const Text(
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