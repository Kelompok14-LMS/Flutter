import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/roboto_text.dart';


class HeaderInputEmail extends StatelessWidget {
  const HeaderInputEmail({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/forgot/forgot_1.svg',
          width: size.width * 0.7,
        ),
        const SizedBox(
          height: 10,
        ),
        const RobotoText(
          text: 'Lupa Kata Sandi',
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 12,
        ),
        const RobotoText(
          text: '''Jangan khawatir! masukkan email
yang tertaut untuk mengakses akunmu kembali''',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
