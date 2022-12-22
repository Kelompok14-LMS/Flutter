import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/finite_state.dart';
import '../../../../view_models/auth_view_model.dart';
import '../../otp_screen.dart';

class ButtonAdd extends StatefulWidget {
  const ButtonAdd({
    Key? key,
    required this.size,
    required this.formKey,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;

  @override
  State<ButtonAdd> createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
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
                final result = await context
                    .read<AuthViewModel>()
                    .sendOtp(widget._emailController.text);
                if (result == 'Sukses kirim OTP ke email') {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result!),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpScreen(email: widget._emailController.text),
                      ),
                    );
                  }
                } else if (result != 'Sukses kirim OTP ke email') {
                  if (mounted) {
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
            child: Text(
              'Kirim',
              style: MyColor().loginField,
            ),
          );
        },
      ),
    );
  }
}
