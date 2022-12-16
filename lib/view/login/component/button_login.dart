import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/users.dart';
import '../../../view_models/auth_view_model.dart';

class ButtonLogin extends StatefulWidget {
  const ButtonLogin({
    Key? key,
    required this.size,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 6,
      child: SizedBox(
        height: widget.size.height * 0.058,
        width: widget.size.width,
        child: Consumer<AuthViewModel>(
          builder: (context, value, child) {
            return ElevatedButton(
              onPressed: () async {
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();

                  final result = await value.login(Users(
                    email: widget._emailController.text,
                    password: widget._passwordController.text,
                  ));
                  if (result == 'Login successful') {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result!),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false);
                    }
                  } else if (result != 'Login successful') {
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
                'Masuk',
                style: MyColor().loginField,
              ),
            );
          },
        ),
      ),
    );
  }
}
