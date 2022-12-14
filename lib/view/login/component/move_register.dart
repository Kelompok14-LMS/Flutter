import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../components/roboto_text.dart';
import '../../register/register_screen.dart';

class MoveRegister extends StatelessWidget {
  const MoveRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RobotoText(
          text: 'Belum punya akun?',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MyColor.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const RobotoText(
            text: 'Daftar',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColor.primaryLogo,
          ),
        ),
      ],
    );
  }
}
