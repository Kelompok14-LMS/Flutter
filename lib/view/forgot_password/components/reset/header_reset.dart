import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/roboto_text.dart';

class HeaderResetPassword extends StatelessWidget {
  const HeaderResetPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RobotoText(
          text: 'Reset kata sandi',
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 20,
        ),
        RobotoText(
          text: 'Identitasmu telah terverifikasi',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        RobotoText(
          text: 'Ayo buat password baru',
          fontSize: 16,
        ),
         SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
