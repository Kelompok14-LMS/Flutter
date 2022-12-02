import 'package:flutter/material.dart';

import 'components/otp/button_add_otp.dart';
import 'components/otp/form_otp.dart';
import 'components/otp/header_otp.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({required this.email, super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _oneController;
  late final TextEditingController _twoController;
  late final TextEditingController _threeController;
  late final TextEditingController _fourController;

  @override
  void initState() {
    _oneController = TextEditingController();
    _twoController = TextEditingController();
    _threeController = TextEditingController();
    _fourController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _oneController.dispose();
    _twoController.dispose();
    _threeController.dispose();
    _fourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderOtp(size: size),
              const SizedBox(
                height: 34,
              ),
              FormOtp(
                  formKey: formKey,
                  size: size,
                  oneController: _oneController,
                  twoController: _twoController,
                  threeController: _threeController,
                  fourController: _fourController),
              const SizedBox(
                height: 34,
              ),
              ButtonAddOtp(
                  size: size,
                  formKey: formKey,
                  oneController: _oneController,
                  twoController: _twoController,
                  threeController: _threeController,
                  fourController: _fourController,
                  widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}
