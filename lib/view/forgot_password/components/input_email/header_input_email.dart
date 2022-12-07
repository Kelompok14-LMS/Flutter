import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RobotoText(
          text: 'Lupa Password?',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: MyColor.primary,
        ),
        SizedBox(
          height: 20,
        ),
        RobotoText(
          text: 'Jangan khawatir',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: MyColor.primary,
          lineHeight: 1.5,
        ),
        RobotoText(
          text: '''Masukkan email yang tertaut untuk 
mengakses akunmu kembali''',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          lineHeight: 1.5,
          color: MyColor.primary,
        ),
      ],
    );
  }
}
