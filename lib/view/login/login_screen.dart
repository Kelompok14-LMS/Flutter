import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/login/component/button_login.dart';
import 'package:edu_world/view/login/component/forgot_password.dart';
import 'package:edu_world/view/login/component/form_login.dart';
import 'package:edu_world/view/login/component/move_register.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang!',
                style: MyColor().fontOnBoarding,
              ),
              const SizedBox(
                height: 20,
              ),
              FormLogin(
                formKey: formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const ForgotPassword(),
              const SizedBox(
                height: 64,
              ),
              ButtonLogin(
                size: size,
                formKey: formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              const MoveRegister(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
