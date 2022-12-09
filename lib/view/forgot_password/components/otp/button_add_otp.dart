import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';
import '../../otp_screen.dart';
import '../../reset_passsword_screen.dart';

class ButtonAddOtp extends StatefulWidget {
  const ButtonAddOtp({
    Key? key,
    required this.size,
    required this.formKey,
    required TextEditingController oneController,
    required TextEditingController twoController,
    required TextEditingController threeController,
    required TextEditingController fourController,
    required this.widget,
  })  : _oneController = oneController,
        _twoController = twoController,
        _threeController = threeController,
        _fourController = fourController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final TextEditingController _oneController;
  final TextEditingController _twoController;
  final TextEditingController _threeController;
  final TextEditingController _fourController;
  final OtpScreen widget;

  @override
  State<ButtonAddOtp> createState() => _ButtonAddOtpState();
}

class _ButtonAddOtpState extends State<ButtonAddOtp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 300,
        height: 48,
        child: ElevatedButton(
          onPressed: ()async {
           final otp = widget._oneController.text +
                widget._twoController.text +
                widget._threeController.text +
                widget._fourController.text;
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              final result = await context
                  .read<AuthViewModel>()
                  .checkOtp(widget.widget.email, otp);
              if (result == 'OTP matched') {
                if (mounted) {
                  print(otp);
                  print(widget.widget.email);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result!),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(
                          email: widget.widget.email, otp: otp),
                    ),
                  );
                }
              } else if (result != 'OTP matched') {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result!),
                    ),
                  );
                }
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColor.primaryLogo,
          ),
          child: Text(
            'Kirim',
            style: MyColor().loginField,
          ),
        ),
      ),
    );
  }
}
