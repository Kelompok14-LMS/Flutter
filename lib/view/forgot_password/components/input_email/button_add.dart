import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../otp_screen.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    Key? key,
    required this.size,
    required this.formKey,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;

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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cek kode OTP melalui Email Kamu'),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(email: _emailController.text),
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
