import 'package:edu_world/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({
    Key? key,
    required TextEditingController fullNameController,
    required TextEditingController numberPhoneController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _fullNameController = fullNameController,
        _numberPhoneController = numberPhoneController,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _fullNameController;
  final TextEditingController _numberPhoneController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final primaryColor = MyColor.primary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Nama Lengkap',
              style: MyColor().loginField,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              hintStyle: MyColor().hintTextField,
              hintText: 'Masukkan Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(15),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Tidak boleh kosong';
              }
              if (value.length < 3) {
                return 'Nama minimal 3 karakter';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Email',
              style: MyColor().loginField,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
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
                return 'Tidak boleh kosong';
              }
              if (email != null && !EmailValidator.validate(email)) {
                return 'Masukkan Email dengan benar';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Nomer Ponsel',
              style: MyColor().loginField,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _numberPhoneController,
            decoration: InputDecoration(
              hintText: 'Masukkan Nomer Ponsel',
              hintStyle: MyColor().hintTextField,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(15),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Tidak boleh kosong';
              }
              return null;
            },
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
          const SizedBox(
            height: 4,
          ),
          Consumer<AuthViewModel>(
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
                      : Icon(Icons.visibility, color: primaryColor),
                ),
                hintText: 'Masukkan Password',
                hintStyle: MyColor().hintTextField,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(15),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                }
                if (value.length < 6) {
                  return 'Password minimal 6 character';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
