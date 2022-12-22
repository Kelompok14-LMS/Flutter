import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/roboto_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';
import '../../otp_screen.dart';

class ResendOtpScreen extends StatefulWidget {
  const ResendOtpScreen({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final OtpScreen widget;

  @override
  State<ResendOtpScreen> createState() => _ResendOtpScreenState();
}

class _ResendOtpScreenState extends State<ResendOtpScreen> {
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
          onTap: () async {
            final result = await context
                .read<AuthViewModel>()
                .sendOtp(widget.widget.email);
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(result!),
                ),
              );
            }
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
