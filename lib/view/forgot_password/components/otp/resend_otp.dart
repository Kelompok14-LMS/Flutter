import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/roboto_text.dart';
import 'package:flutter/material.dart';

class ResendOtpScreen extends StatelessWidget {
  const ResendOtpScreen({
    Key? key,
  }) : super(key: key);

  final infoColor = MyColor.info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RobotoText(
          text: 'Tidak menerima kode OTP?',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MyColor.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const RegisterScreen(),
            //   ),
            // );
          },
          child: const RobotoText(
            text: 'Kirim Ulang',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColor.primaryLogo,
          ),
        ),
      ],
    );
  }
}
