
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
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
          Positioned(
            top: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.30,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/login/pict_3.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 90,
            right: 90,
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
