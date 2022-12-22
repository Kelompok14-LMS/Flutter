import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/finite_state.dart';
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
    return SingleChildScrollView(
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height * 0.068,
        child: Consumer<AuthViewModel>(
          builder: (context, value, child) {
            if (value.state == ViewState.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: MyColor.primaryLogo,
                  color: Colors.white,
                ),
              );
            }
            return ElevatedButton(
              onPressed: () async {
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();
                  final result =
                      await context.read<AuthViewModel>().forgotPassword(
                            widget.widget.email,
                            widget._passController.text,
                            widget._confirmController.text,
                            widget.widget.otp,
                          );
                  if (result == 'Sukses ganti kata sandi') {
                    if (mounted) {
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
                  } else if (result != 'Sukses ganti kata sandi') {
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 6),
              child: Text(
                'Kirim',
                style: MyColor().loginField,
              ),
            );
          },
        ),
      ),
    );
  }
}
