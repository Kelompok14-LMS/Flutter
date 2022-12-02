import 'package:flutter/material.dart';

import 'components/reset/button_reset.dart';
import 'components/reset/form_reset_password.dart';
import 'components/reset/header_reset.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderResetPassword(size: size),
              FormResetPassword(
                formKey: formKey,
                passController: _passController,
                confirmController: _confirmController,
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonReset(size: size, formKey: formKey),
            ],
          ),
        ),
      ),
    );
  }
}
