import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/roboto_text.dart';
import 'package:edu_world/view/components/search_bar.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseViewModel>(context, listen: false).scrollControll();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final courseViewModel = Provider.of<CourseViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SearchBar(titleSearch: 'Cari di Kursusku'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(courseViewModel.myCourseList.length,
                      (index) {
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        // side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                courseViewModel.myCourseList[index].thumbnail!,
                              ),
                              fit: BoxFit.fill),
                        ),
                        height: 160,
                        width: 380,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            courseViewModel
                                                .myCourseList[index].title!,
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
                                                courseViewModel
                                                    .myCourseList[index]
                                                    .mentorName!,
                                                style: const TextStyle(
                                                    color: MyColor.primary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              const Icon(
                                                Icons.favorite,
                                                color: MyColor.primaryLogo,
                                                size: 20,
                                              ),
                                              const RobotoText(
                                                text: '(63)',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: MyColor.primary,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 60,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    margin: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                      ),
                                    ),
                                    child: InkWell(
                                      onLongPress: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: RobotoText(
                                          text: 'Edit',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: MyColor.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(16),
                                          percent: 0.8,
                                          lineHeight: 23,
                                          progressColor: MyColor.primaryLogo,
                                          backgroundColor: Colors.white,
                                          center: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              RobotoText(
                                                text: '80%',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: const Icon(
                                  //     Icons.favorite,
                                  //     color: MyColor.primaryLogo,
                                  //     size: 26,
                                  //   ),
                                  //   padding: EdgeInsets.zero,
                                  //   constraints: const BoxConstraints(),
                                  // )
                                  Stack(
                                    alignment: Alignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        color: MyColor.primary,
                                        size: 28,
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.favorite,
                                          color: MyColor.primaryLogo,
                                          size: 26,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
