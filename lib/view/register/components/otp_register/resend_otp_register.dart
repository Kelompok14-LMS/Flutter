import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/users.dart';
import '../../../../utils/constant.dart';
import '../../../../view_models/auth_view_model.dart';
import '../../../components/roboto_text.dart';
import '../../otp_registrasi_screen.dart';

class ResendOtpRegister extends StatelessWidget {
  const ResendOtpRegister({
    Key? key,
    required this.widget,
    required this.mounted,
  }) : super(key: key);

  final OtpRegistrasiScreen widget;
  final bool mounted;

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
            final result = await context.read<AuthViewModel>().register(
                  Users(
                    email: widget.email,
                    password: widget.password,
                  ),
                );
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
