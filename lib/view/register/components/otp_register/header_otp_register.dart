import 'package:flutter/material.dart';

import '../../../components/roboto_text.dart';

class HeaderOtpRegister extends StatelessWidget {
  const HeaderOtpRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RobotoText(
          text: 'Verifikasi OTP',
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 30,
        ),
        RobotoText(
          text: 'Kode Hanya Berlaku 5 Menit',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        RobotoText(
          text: '''Masukkan 4 digit kode verifikasi OTP 
yang dikirim ke alamat emailmu''',
          fontSize: 16,
        ),
        SizedBox(
          height: 21,
        ),
      ],
    );
  }
}
