import 'package:edu_world/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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
  final primaryColor = MyColor.primary;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Email',
              style: MyColor().loginField,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan Email',
                hintStyle: MyColor().hintTextField,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(15),
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Password',
              style: MyColor().loginField,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
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
                          ? Icon(Icons.visibility_off, color: primaryColor)
                          : Icon(Icons.visibility, color: primaryColor)),
                  hintText: 'Masukkan Password',
                  hintStyle: MyColor().hintTextField,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Tidak boleh kosong';
                  }
                  if (value != null && value.length < 6) {
                    return 'Password mininam 6 karakter';
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
