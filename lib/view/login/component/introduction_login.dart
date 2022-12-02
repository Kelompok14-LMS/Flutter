import 'package:flutter/material.dart';

import '../../components/roboto_text.dart';


class IntroductionLogin extends StatelessWidget {
  const IntroductionLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              RobotoText(
                text: 'Hallo Mentee',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                lineHeight: 1.2,
              ),
              RobotoText(
                text: 'Mulai akses course dengan gratis',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                lineHeight: 1.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
