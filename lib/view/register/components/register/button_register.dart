import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/users.dart';
import '../../../../utils/finite_state.dart';
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
    required TextEditingController numberPhoneController,
    required TextEditingController passwordController,
    required TextEditingController fullNameController,
  })  : _emailController = emailController,
        _numberPhoneController = numberPhoneController,
        _passwordController = passwordController,
        _fullNameController = fullNameController,
        super(key: key);

  final Size size;
  final bool checkboxValue;
  final bool mounted;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _numberPhoneController;
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
      height: widget.size.height * 0.068,
      child: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          if (value.state == ViewState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: MyColor.primaryLogo,
                color: Colors.white,
              ),
            );
          }
          return ElevatedButton(
            onPressed: () async {
              if (widget.formKey.currentState!.validate()) {
                widget.formKey.currentState!.save();

                final result = await value.register(
                  Users(
                    email: widget._emailController.text,
                    password: widget._passwordController.text,
                  ),
                );

                if (result == 'Sukses mengirim OTP ke email') {
                  if (widget.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OtpRegistrasiScreen(
                            fullName: widget._fullNameController.text,
                            phone: widget._numberPhoneController.text,
                            email: widget._emailController.text,
                            password: widget._passwordController.text),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result!),
                      ),
                    );
                  }
                } else if (result != 'Sukses mengirim OTP ke email') {
                  if (widget.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result!),
                      ),
                    );
                  }
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.primaryLogo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 6,
            ),
            child: const RobotoText(
              text: 'Daftar',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MyColor.primary,
            ),
          );
        },
      ),
    );
  }
}
