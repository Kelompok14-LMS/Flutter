import 'package:flutter/material.dart';

import '../components/roboto_text.dart';
import 'components/reset/button_reset.dart';
import 'components/reset/form_reset_password.dart';
import 'components/reset/header_reset.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _passController;
  late final TextEditingController _confirmController;

  @override
  void initState() {
    _passController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          label: const RobotoText(
            text: 'Kembali',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeaderResetPassword(),
                FormResetPassword(
                  formKey: formKey,
                  passController: _passController,
                  confirmController: _confirmController,
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonReset(
                  size: size,
                  formKey: formKey,
                  passController: _passController,
                  confirmController: _confirmController,
                  widget: widget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
