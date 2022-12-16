import 'package:edu_world/view/components/roboto_text.dart';
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RobotoText(
      text: 'Selamat Datang!',
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
  }
}
