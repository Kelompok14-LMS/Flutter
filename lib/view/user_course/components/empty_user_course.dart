import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

class EmptyUserCourse extends StatelessWidget {
  EmptyUserCourse({super.key, required this.isOngoing});
  bool isOngoing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isOngoing
                ? Image.network(
                    'https://i.ibb.co/YtwP0Zp/emptycourseongoing.png')
                : Image.network('https://i.ibb.co/ZXgMpSw/Group.png'),
            const SizedBox(
              height: 64,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: MyColor().emptyCourseTextStyle,
                children: <TextSpan>[
                  const TextSpan(text: '''Belum Ada Kursus
yang '''),
                  TextSpan(
                    text: isOngoing ? 'Diambil' : 'Selesai',
                    style: MyColor().emptyCourseTextStyleSpan,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
