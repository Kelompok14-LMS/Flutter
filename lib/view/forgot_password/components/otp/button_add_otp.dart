import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../otp_screen.dart';
import '../../reset_passsword_screen.dart';

class ButtonAddOtp extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 300,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              final otp = _oneController.text +
                  _twoController.text +
                  _threeController.text +
                  _fourController.text;
              print(otp);
              print(widget.email);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                ),
              );
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
