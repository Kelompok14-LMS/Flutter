
import 'package:edu_world/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/auth_view_model.dart';


class FormRegister extends StatelessWidget {
  const FormRegister({
    Key? key,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController numberPhoneController,
    required TextEditingController passwordController,
  })  : _fullNameController = fullNameController,
        _emailController = emailController,
        _numberPhoneController = numberPhoneController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _numberPhoneController;
  final TextEditingController _passwordController;
  final primaryColor = MyColor.primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryColor),
            hintText: 'Masukkan nama kamu',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.person,
                size: 20,
                color: primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Tidak boleh kosong';
            }
            if (value.length < 3) {
              return 'Nama min.3 character';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Masukkan email',
            hintStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.alternate_email,
                size: 20,
                color: primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
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
          height: 8,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _numberPhoneController,
          decoration: InputDecoration(
            hintText: 'Masukkan nomor telepon',
            hintStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.phone,
                size: 20,
                color: primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
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
          height: 8,
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
                    ? Icon(Icons.visibility_off,
                        color: primaryColor)
                    : Icon(Icons.visibility,
                        color: primaryColor),
              ),
              hintText: 'Masukkan kata sandi',
              hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
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
        const SizedBox(
          height: 8,
        ),
        Consumer<AuthViewModel>(
          builder: (context, value, child) => TextFormField(
            obscureText: value.isTrue1,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  value.toggleObs2();
                },
                icon: value.isTrue1
                    ? Icon(Icons.visibility_off,
                        color: primaryColor)
                    : Icon(Icons.visibility,
                        color: primaryColor),
              ),
              hintText: 'Konfirmasi kata sandi',
              hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
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
              } else if (value != _passwordController.text) {
                return 'Password Berbeda';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}