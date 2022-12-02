import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/roboto_text.dart';


class HeaderResetPassword extends StatelessWidget {
  const HeaderResetPassword({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/forgot/forgot_3.svg',
          width: size.width * 0.7,
        ),
        const SizedBox(
          height: 47,
        ),
        const RobotoText(
          text: 'Reset kata sandi',
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 6,
        ),
        const RobotoText(
          text: '''Identitas kamu telah di verifikasi
atur kata sandi baru kamu''',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
