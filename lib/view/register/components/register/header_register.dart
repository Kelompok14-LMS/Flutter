import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ayo Jadi Mentee!',
      style: MyColor().fontOnBoarding,
    );
  }
}
