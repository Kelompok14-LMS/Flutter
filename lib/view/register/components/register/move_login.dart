import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../components/roboto_text.dart';
import '../../../login/login_screen.dart';

class MoveLogin extends StatelessWidget {
  const MoveLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RobotoText(
          text: 'Sudah Punya Akun?',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          width: 3,
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          },
          child: const RobotoText(
            text: 'Masuk',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColor.primaryLogo,
          ),
        ),
      ],
    );
  }
}
