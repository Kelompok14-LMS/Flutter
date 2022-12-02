import 'package:edu_world/utils/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/roboto_text.dart';
import 'components/register/button_register.dart';
import 'components/register/form_register.dart';
import 'components/register/header_register.dart';
import 'components/register/move_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _numberPhoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  var checkboxValue = false;
  final infoColor = MyColor.info;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _numberPhoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _numberPhoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderRegister(size: size),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RobotoText(
                    text: 'Buat Akun',
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        FormRegister(
                            fullNameController: _fullNameController,
                            emailController: _emailController,
                            numberPhoneController: _numberPhoneController,
                            passwordController: _passwordController),

                        ///CheckBox
                        Row(
                          children: [
                            FormField(
                              validator: (value) {
                                if (!checkboxValue) return 'Harap Ceklis';
                                return null;
                              },
                              builder: (field) => Checkbox(
                                value: checkboxValue,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      checkboxValue = value!;
                                      field.didChange(value);
                                    },
                                  );
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const RobotoText(
                                  text: 'Dengan mendaftar kamu sudah',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'setuju dengan',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' Syarat dan ketentuan',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: infoColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            ///Todo
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ButtonRegister(
                          size: size,
                          checkboxValue: checkboxValue,
                          mounted: mounted,
                          formKey: formKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          fullNameController: _fullNameController,
                          numberPhoneController: _numberPhoneController,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const MoveLogin(),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
