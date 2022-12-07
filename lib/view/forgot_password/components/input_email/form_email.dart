import 'package:edu_world/utils/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormEmail extends StatefulWidget {
  const FormEmail({
    Key? key,
    required this.formKey,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;

  @override
  State<FormEmail> createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = MyColor.primary;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: widget.formKey,
      child: TextFormField(
        controller: widget._emailController,
        decoration: InputDecoration(
          hintText: 'Masukkan Email',
          hintStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
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
          } else {
            return null;
          }
        },
      ),
    );
  }
}
