import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mentees.dart';
import '../../models/users.dart';
import '../../view_models/auth_view_model.dart';
import '../login/login_screen.dart';
import 'components/otp_register/form_otp_register.dart';
import 'components/otp_register/header_otp_register.dart';

class OtpRegistrasiScreen extends StatefulWidget {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  const OtpRegistrasiScreen(
      {super.key,
      this.fullName = '',
      this.phone = '',
      required this.email,
      required this.password});

  @override
  State<OtpRegistrasiScreen> createState() => _OtpRegistrasiScreenState();
}

class _OtpRegistrasiScreenState extends State<OtpRegistrasiScreen> {
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
              HeaderOtpRegister(size: size),
              FormOtpRegister(
                  formKey: formKey,
                  size: size,
                  oneController: _oneController,
                  twoController: _twoController,
                  threeController: _threeController,
                  fourController: _fourController),
              const SizedBox(
                height: 34,
              ),

              //Button
              Card(
                elevation: 6,
                child: SizedBox(
                  width: size.width * 0.93,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () async {
                      final otp = _oneController.text +
                          _twoController.text +
                          _threeController.text +
                          _fourController.text;
                      print(otp);
                      print(widget.fullName);
                      print(widget.phone);
                      print(widget.email);
                      print(widget.password);
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        final result = await context
                            .read<AuthViewModel>()
                            .registrasi(
                                Users(
                                    email: widget.email,
                                    password: widget.password),
                                Mentees(
                                  fullName: widget.fullName,
                                  phone: widget.phone,
                                ));

                        if (result == 'Berhasil mendaftar') {
                          if (mounted) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (context) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text('Masukkan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
