import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      children: [
        SvgPicture.asset(
          'assets/forgot/forgot_2.svg',
          width: size.width * 0.7,
        ),
        const RobotoText(
          text: 'Masukkan OTP',
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 6,
        ),
        const RobotoText(
          text: '''Masukkan 4 digit kode verifikasi
yang dikirimkan ke alamat emailmu''',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
