import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/mentees.dart';
import '../../../../models/users.dart';
import '../../../../view_models/auth_view_model.dart';
import '../../../components/roboto_text.dart';
import '../../otp_registrasi_screen.dart';

class ButtonRegister extends StatefulWidget {
  const ButtonRegister({
    Key? key,
    required this.size,
    required this.checkboxValue,
    required this.mounted,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController fullNameController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _fullNameController = fullNameController,
        super(key: key);

  final Size size;
  final bool checkboxValue;
  final bool mounted;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _fullNameController;

  @override
  State<ButtonRegister> createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: 56,
      child: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 6,
            child: ElevatedButton(
              onPressed: () async {
                if (widget.checkboxValue == false) {
                  if (widget.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Harap Ceklis untuk mendaftar'),
                      ),
                    );
                  }
                }
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();

                  final result = await value.registrasi(
                      Users(
                        email: widget._emailController.text,
                        password: widget._passwordController.text,
                      ),
                      Mentees(
                        fullName: widget._fullNameController.text,
                      ));

                  if (result == 'Berhasil mendaftar') {
                    if (widget.mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OtpRegistrasiScreen(
                              fullName: widget._fullNameController.text,
                              email: widget._emailController.text,
                              password: widget._passwordController.text),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cek kode OTP melalui Email Kamu'),
                        ),
                      );
                    }
                  } else if (result == 'Gagal Mendaftar') {
                    if (widget.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.primaryLogo,
              ),
              child: const RobotoText(
                text: 'Daftar',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: MyColor.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
