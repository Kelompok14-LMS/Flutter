import 'package:flutter/material.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height * 0.30,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.30,
            child: Image.asset(
              'assets/login/pict_3.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 90,
            right: 90,
            top: 60,
            child: SizedBox(
              height: size.height * 0.22,
              child: Image.asset(
                'assets/login/logo_1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
