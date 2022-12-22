import 'package:edu_world/utils/finite_state.dart';
import 'package:edu_world/view/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mentees.dart';
import '../../models/users.dart';
import '../../utils/constant.dart';
import '../../view_models/auth_view_model.dart';
import '../components/roboto_text.dart';
import '../login/login_screen.dart';
import 'components/otp_register/form_otp_register.dart';
import 'components/otp_register/header_otp_register.dart';
import 'components/otp_register/resend_otp_register.dart';

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
        leadingWidth: 200,
        leading: (TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          label: const RobotoText(
            text: 'Kembali',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          if (value.state == ViewState.error) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Terjadi Kesalahan!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderOtpRegister(),
                  FormOtpRegister(
                    formKey: formKey,
                    size: size,
                    oneController: _oneController,
                    twoController: _twoController,
                    threeController: _threeController,
                    fourController: _fourController,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  //Button
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.06,
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
                            final otp = _oneController.text +
                                _twoController.text +
                                _threeController.text +
                                _fourController.text;
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              final result = await context
                                  .read<AuthViewModel>()
                                  .registerVerify(
                                      Users(
                                        email: widget.email,
                                        password: widget.password,
                                        otp: otp,
                                      ),
                                      Mentees(
                                        fullName: widget.fullName,
                                        phone: widget.phone,
                                      ));

                              if (result == 'Register berhasil') {
                                if (mounted) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                      (context) => false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(result!),
                                    ),
                                  );
                                }
                              } else if (result != 'Register berhasil') {
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 6,
                          ),
                          child: const RobotoText(
                            text: 'Kirim',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: MyColor.primary,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ResendOtpRegister(
                    widget: widget,
                    mounted: mounted,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
