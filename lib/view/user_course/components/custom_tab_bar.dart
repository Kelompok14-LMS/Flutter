// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:edu_world/utils/constant.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.mentee,
  }) : super(key: key);
  final TabController tabController;
  final String mentee;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Card(
          elevation: 2,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            height: 56,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                splashBorderRadius: BorderRadius.circular(16),
                labelColor: MyColor.primary,
                controller: widget.tabController,
                indicator: BoxDecoration(
                  color: MyColor.primaryLogo,
                  borderRadius: BorderRadius.circular(16),
                ),
                labelStyle: MyColor().tabBarTextStyle,
                tabs: const [
                  Tab(
                    text: 'Berlangsung',
                  ),
                  Tab(
                    text: 'Selesai',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
