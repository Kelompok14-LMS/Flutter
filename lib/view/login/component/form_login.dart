import 'package:edu_world/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_models/auth_view_model.dart';


class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final  primaryColor = MyColor.primary;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan Email',
                hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor ),
                prefixIcon: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.alternate_email,
                    size: 20,
                    color: MyColor.primary,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              validator: (email) {
                if (email == '') {
                  return 'Email tidak boleh kosong';
                }
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Masukkan email dengan benar';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
            child: Consumer<AuthViewModel>(
              builder: (context, value, child) => TextFormField(
                obscureText: value.isTrue,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        value.toggleObs();
                      },
                      icon: value.isTrue
                          ? Icon(Icons.visibility_off,
                              color: primaryColor)
                          : Icon(Icons.visibility,
                              color: primaryColor)),
                  hintText: 'Masukkan Kata Sandi',
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Tidak boleh kosong';
                  }
                  if (value != null && value.length < 6) {
                    return 'Password min.6 character';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
