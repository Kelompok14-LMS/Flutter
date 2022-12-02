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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: TextFormField(
          controller: widget._emailController,
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Icon(
                Icons.alternate_email,
                size: 20,
                color: primaryColor,
              ),
            ),
            hintText: 'Email',
            hintStyle: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: primaryColor,
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
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
