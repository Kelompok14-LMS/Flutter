// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:edu_world/utils/constant.dart';

class SliderPage extends StatelessWidget {
  final String image;
  final String desc;
  final String diffDesc;
  const SliderPage({
    Key? key,
    required this.image,
    required this.desc,
    required this.diffDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: size.width * 0.6,
            ),
            const SizedBox(
              height: 64,
            ),
            RichText(
              text: TextSpan(
                style: MyColor().fontOnBoarding,
                children: <TextSpan>[
                  TextSpan(text: desc),
                  TextSpan(
                    text: diffDesc,
                    style: MyColor().fontOnBoardingDiff,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
