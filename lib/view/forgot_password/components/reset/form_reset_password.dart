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
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Password Baru',
                style: MyColor().loginField,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Consumer<AuthViewModel>(
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
                        : Icon(Icons.visibility, color: primaryColor),
                  ),
                  hintText: 'Masukkan password baru',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
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
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Konfirmasi Password Baru',
                style: MyColor().loginField,
              ),
            ),
            Consumer<AuthViewModel>(
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
                  hintText: 'Konfirmasi password baru',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
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
                  if (value != _passController.text) {
                    return 'Password berbeda';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}
