import 'package:flutter/material.dart';

import 'component/button_login.dart';
import 'component/forgot_password.dart';
import 'component/form_login.dart';
import 'component/header_login.dart';
import 'component/introduction_login.dart';
import 'component/move_register.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              HeaderLogin(size: size),
              const IntroductionLogin(),
              FormLogin(
                  formKey: formKey,
                  emailController: _emailController,
                  passwordController: _passwordController),
              const ForgotPassword(),
              const SizedBox(
                height: 32,
              ),
              ButtonLogin(
                size: size,
                formKey: formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(
                height: 6,
              ),
              const MoveRegister(),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Gunakan email ini untuk Login : eve.holt@reqres.in',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Gunakan password ini untuk Login : cityslicka',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
