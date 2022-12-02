import 'package:flutter/material.dart';

import '../../../login/login_screen.dart';

class ButtonReset extends StatelessWidget {
  const ButtonReset({
    Key? key,
    required this.size,
    required this.formKey,
  }) : super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: size.width * 0.93,
        height: size.height * 0.07,
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            }
          },
          child: const Text('Masukkan'),
        ),
      ),
    );
  }
}
