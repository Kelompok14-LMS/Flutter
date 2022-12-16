// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/view/detail_course/modul_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/roboto_text.dart';
import 'package:edu_world/view/user_course/components/empty_user_course.dart';
import 'package:edu_world/view_models/couse_view_model.dart';

class UserListCourse extends StatefulWidget {
  const UserListCourse({
    Key? key,
    required this.status,
    required this.isOngoing,
  }) : super(key: key);
  // final List<CourseModel> userCourseModel;
  final String status;
  final bool isOngoing;

  @override
  State<UserListCourse> createState() => _UserListCourseState();
}

class _UserListCourseState extends State<UserListCourse> {
  String mentee = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final share = await SharedPreferences.getInstance();
      final token = share.getString('token');
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      mentee = (payload['mentee_id']);
      if (!mounted) return;
      Provider.of<CourseViewModel>(context, listen: false)
          .getEnrolledCourseMentee(mentee, "", widget.status);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseViewModel>(
      builder: (context, value, child) {
        if (widget.isOngoing
            ? value.courseCardModel.isNotEmpty
            : value.endCourseCardModel.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                  widget.isOngoing
                      ? value.courseCardModel.length
                      : value.endCourseCardModel.length, (index) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ModulCourseScreen(
                            mentee: mentee,
                            courseModel: value.courseCardModel[index]),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.isOngoing
                                ? value.courseCardModel[index].thumbnail!
                                : value.endCourseCardModel[index].thumbnail!),
                            fit: BoxFit.fill),
                      ),
                      height: 160,
                      width: 380,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 234,
                            child: Card(
                              margin: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.isOngoing
                                          ? value.courseCardModel[index].title!
                                          : value
                                              .endCourseCardModel[index].title!,
                                      style: MyColor().loginField,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.isOngoing
                                              ? value.courseCardModel[index]
                                                  .mentorName!
                                              : value.endCourseCardModel[index]
                                                  .mentorName!,
                                          style: const TextStyle(
                                              color: MyColor.primary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: MyColor.primaryLogo,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const RobotoText(
                                          text: '4.7',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: MyColor.primary,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const RobotoText(
                                          text: '(63)',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8896A7),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              barRadius: const Radius.circular(16),
                              percent: 0.8,
                              lineHeight: 23,
                              progressColor: MyColor.primaryLogo,
                              backgroundColor: Colors.white,
                              center: const RobotoText(
                                text: '80%',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return EmptyUserCourse(
            isOngoing: widget.status == 'ongoing',
          );
        }
      },
    );
  }
}
