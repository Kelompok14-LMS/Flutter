import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';

class FormResetPassword extends StatelessWidget {
  const FormResetPassword({
    Key? key,
    required this.formKey,
    required TextEditingController passController,
    required TextEditingController confirmController,
  })  : _passController = passController,
        _confirmController = confirmController,
        super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController _passController;
  final TextEditingController _confirmController;
  final primaryColor = MyColor.primary;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Consumer<AuthViewModel>(
              builder: (context, value, child) => TextFormField(
                obscureText: value.isTrue,
                controller: _passController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.toggleObs();
                    },
                    icon: value.isTrue
                        ? Icon(
                            Icons.visibility_off,
                            color: primaryColor,
                          )
                        : Icon(Icons.visibility,
                            color: primaryColor),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: primaryColor,
                    ),
                  ),
                  hintText: 'Masukkan kata sandi baru',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password min.6 character';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer<AuthViewModel>(
              builder: (context, value, child) => TextFormField(
                obscureText: value.isTrue1,
                controller: _confirmController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.toggleObs2();
                    },
                    icon: value.isTrue
                        ? Icon(
                            Icons.visibility_off,
                            color: primaryColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: primaryColor,
                          ),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(
                      Icons.lock_outline,
                      size: 20,
                    ),
                  ),
                  hintText: 'Konfirmasi kata sandi baru',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  if (value != _passController.text) {
                    return 'Password berbeda';
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
