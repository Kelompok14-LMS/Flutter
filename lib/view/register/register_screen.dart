import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/register/components/register/form_register.dart';
import 'package:edu_world/view/register/components/register/header_register.dart';
import 'package:edu_world/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/finite_state.dart';
import 'components/register/button_register.dart';
import 'components/register/move_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _numberPhoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  var checkboxValue = false;
  final infoColor = MyColor.info;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _numberPhoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _numberPhoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderRegister(),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            FormRegister(
                                fullNameController: _fullNameController,
                                numberPhoneController: _numberPhoneController,
                                emailController: _emailController,
                                passwordController: _passwordController),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonRegister(
                              size: size,
                              checkboxValue: checkboxValue,
                              mounted: mounted,
                              formKey: formKey,
                              emailController: _emailController,
                              numberPhoneController: _numberPhoneController,
                              passwordController: _passwordController,
                              fullNameController: _fullNameController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const MoveLogin(),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       HeaderRegister(size: size),
      //       Form(
      //         autovalidateMode: AutovalidateMode.onUserInteraction,
      //         key: formKey,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const RobotoText(
      //               text: 'Buat Akun',
      //               fontSize: 22,
      //               fontWeight: FontWeight.w400,
      //             ),
      //             const SizedBox(
      //               height: 8,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 left: 16,
      //                 right: 16,
      //               ),
      //               child: Column(
      //                 children: [
      //                   FormRegister(
      //                       fullNameController: _fullNameController,
      //                       emailController: _emailController,
      //                       numberPhoneController: _numberPhoneController,
      //                       passwordController: _passwordController),

      //                   ///CheckBox
      //                   Row(
      //                     children: [
      //                       FormField(
      //                         validator: (value) {
      //                           if (!checkboxValue) return 'Harap Ceklis';
      //                           return null;
      //                         },
      //                         builder: (field) => Checkbox(
      //                           value: checkboxValue,
      //                           onChanged: (bool? value) {
      //                             setState(
      //                               () {
      //                                 checkboxValue = value!;
      //                                 field.didChange(value);
      //                               },
      //                             );
      //                           },
      //                         ),
      //                       ),
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           const RobotoText(
      //                             text: 'Dengan mendaftar kamu sudah',
      //                             fontSize: 14,
      //                             fontWeight: FontWeight.w500,
      //                           ),
      //                           Text.rich(
      //                             TextSpan(
      //                               text: 'setuju dengan',
      //                               style: GoogleFonts.roboto(
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w500,
      //                               ),
      //                               children: [
      //                                 TextSpan(
      //                                   text: ' Syarat dan ketentuan',
      //                                   style: GoogleFonts.roboto(
      //                                       fontSize: 14,
      //                                       fontWeight: FontWeight.w500,
      //                                       color: infoColor),
      //                                   recognizer: TapGestureRecognizer()
      //                                     ..onTap = () {
      //                                       ///Todo
      //                                     },
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 8,
      //                   ),
      //                   ButtonRegister(
      //                     size: size,
      //                     checkboxValue: checkboxValue,
      //                     mounted: mounted,
      //                     formKey: formKey,
      //                     emailController: _emailController,
      //                     passwordController: _passwordController,
      //                     fullNameController: _fullNameController,
      //                     numberPhoneController: _numberPhoneController,
      //                   ),
      //                   const SizedBox(
      //                     height: 8,
      //                   ),
      //                   const MoveLogin(),
      //                   const SizedBox(
      //                     height: 16,
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
