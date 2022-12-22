// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/view/detail_course/enrolled_course/enrolled_course_screen.dart';
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
  double percentCourse = 0;
  double percentEndCourse = 0;

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
        if (value.errorMessage == '502') {
          return const Center(child: Text('error 502, gagal memuat data'));
        }
        if (widget.isOngoing
            ? value.courseCardModel.isNotEmpty
            : value.endCourseCardModel.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                  widget.isOngoing
                      ? value.courseCardModel.length
                      : value.endCourseCardModel.length, (index) {
                if (widget.isOngoing) {
                  percentCourse = value.courseCardModel[index].progress! /
                      value.courseCardModel[index].totalMaterials!;
                } else {
                  percentEndCourse = value.endCourseCardModel[index].progress! /
                      value.endCourseCardModel[index].totalMaterials!;
                }
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EnrolledCourseScreen(
                              isHaveData: true,
                              mentee: mentee,
                              courseModel: widget.isOngoing
                                  ? value.courseCardModel[index]
                                  : value.endCourseCardModel[index]),
                        ),
                      );
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
                              percent: widget.isOngoing
                                  ? percentCourse.toDouble() <= 1.0
                                      ? percentCourse.toDouble()
                                      : 1
                                  : percentEndCourse.toDouble() <= 1.0
                                      ? percentEndCourse.toDouble()
                                      : 1,
                              lineHeight: 23,
                              progressColor: MyColor.primaryLogo,
                              backgroundColor: Colors.white,
                              center: RobotoText(
                                text: widget.isOngoing
                                    ? "${(percentCourse * 100).isNaN ? 0 : (percentCourse * 100).toInt()}%"
                                    : "${(percentEndCourse * 100).isNaN ? 0 : (percentEndCourse * 100).toInt()}%",
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
