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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderInputEmail(size: size),
              const SizedBox(
                height: 24,
              ),
              FormEmail(
                formKey: formKey,
                emailController: _emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonAdd(
                  size: size,
                  formKey: formKey,
                  emailController: _emailController),
            ],
          ),
        ),
      ),
    );
  }
}
