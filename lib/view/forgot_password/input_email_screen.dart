import 'package:edu_world/view/components/roboto_text.dart';
import 'package:flutter/material.dart';

import 'components/input_email/button_add.dart';
import 'components/input_email/form_email.dart';
import 'components/input_email/header_input_email.dart';

class InputEmailScreen extends StatefulWidget {
  const InputEmailScreen({super.key});

  @override
  State<InputEmailScreen> createState() => _InputEmailScreenState();
}

class _InputEmailScreenState extends State<InputEmailScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          label: const RobotoText(
            text: 'Kembali',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderInputEmail(size: size),
              const SizedBox(
                height: 20,
              ),
              FormEmail(
                formKey: formKey,
                emailController: _emailController,
              ),
              const SizedBox(
                height: 64,
              ),
              ButtonAdd(
                size: size,
                formKey: formKey,
                emailController: _emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
