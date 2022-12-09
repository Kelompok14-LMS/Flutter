import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';
import '../../../login/login_screen.dart';
import '../../reset_passsword_screen.dart';

class ButtonReset extends StatefulWidget {
  const ButtonReset({
    Key? key,
    required this.size,
    required this.formKey,
    required this.widget,
    required TextEditingController passController,
    required TextEditingController confirmController,
  })  : _passController = passController,
        _confirmController = confirmController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final ResetPasswordScreen widget;
  final TextEditingController _passController;
  final TextEditingController _confirmController;

  @override
  State<ButtonReset> createState() => _ButtonResetState();
}

class _ButtonResetState extends State<ButtonReset> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: widget.size.width * 0.93,
        height: widget.size.height * 0.07,
        child: ElevatedButton(
          onPressed: () async {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              final result = await context.read<AuthViewModel>().forgotPassword(
                    widget.widget.email,
                    widget._passController.text,
                    widget._confirmController.text,
                    widget.widget.otp,
                  );
              if (result == 'Success reset password') {
                if (mounted) {
                  print(widget.widget.email);
                  print(widget.widget.otp);
                  print(widget._passController.text);
                  print(widget._confirmController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result!),
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                }
              } else if (result != 'Success reset password') {
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
          child: const Text('Masukkan'),
        ),
      ),
    );
  }
}
