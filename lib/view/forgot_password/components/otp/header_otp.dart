import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../components/roboto_text.dart';

class HeaderOtp extends StatelessWidget {
  const HeaderOtp({
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
          text: 'Verifikasi OTP',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: MyColor.primary,
        ),
        SizedBox(
          height: 20,
        ),
        RobotoText(
          text: 'Kode Hanya Berlaku 5 Menit',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: MyColor.primary,
          lineHeight: 1.5,
        ),
        RobotoText(
          text: '''Masukkan 4 digit kode verifikasi OTP
yang dikirim ke alamt emailmu''',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          lineHeight: 1.5,
          color: MyColor.primary,
        ),
      ],
    );
  }
}
