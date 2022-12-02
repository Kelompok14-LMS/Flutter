import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/roboto_text.dart';

class SliderPage extends StatelessWidget {
  final String image;
  final String desc;
  const SliderPage({required this.image, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: size.width * 0.7,
          ),
          RobotoText(
            fontWeight: FontWeight.w500,
            text: desc,
            fontSize: 18,
            textAlign: TextAlign.justify,
            lineHeight: 1.4,
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
        ],
      ),
    );
  }
}
