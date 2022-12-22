import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../components/roboto_text.dart';
import '../../forgot_password/input_email_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InputEmailScreen(),
              ),
            );
          },
          child: const RobotoText(
            text: 'Lupa password?',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColor.primaryLogo,
          ),
        ),
      ],
    );
  }
}
