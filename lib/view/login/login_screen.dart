import 'package:edu_world/utils/finite_state.dart';
import 'package:edu_world/view/login/components/button_login.dart';
import 'package:edu_world/view/login/components/forgot_password.dart';
import 'package:edu_world/view/login/components/form_login.dart';
import 'package:edu_world/view/login/components/header_login.dart';
import 'package:edu_world/view/login/components/move_register.dart';
import 'package:edu_world/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    checkExpTokenJwt();
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
      body: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          if (value.state == ViewState.error) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Terjadi Kesalahan!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderLogin(),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void checkExpTokenJwt() async {
    final helper = await SharedPreferences.getInstance();
    final token = helper.getString('token');
    if (token != null) {
      DateTime? expiredDate = Jwt.getExpiryDate(token);
      bool hasExpired = Jwt.isExpired(token);
      print('date expaired token : $expiredDate');
      print('expaired? : $hasExpired');
      print(token);
      if (hasExpired == true) {
        helper.remove('token');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Batas waktu telah habis'),
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
      }
    }
    return null;
  }
}
