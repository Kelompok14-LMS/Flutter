// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:flutter/material.dart';

import 'package:edu_world/utils/constant.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBarUserCourse extends StatelessWidget {
  const SearchBarUserCourse({
    Key? key,
    required this.titleSearch,
  }) : super(key: key);
  final String titleSearch;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchKeyword = TextEditingController();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: TextFormField(
        autocorrect: false,
        controller: searchKeyword,
        onFieldSubmitted: (value) async {
          final share = await SharedPreferences.getInstance();
          final token = share.getString('token');
          Map<String, dynamic> payload = Jwt.parseJwt(token!);
          String mentee = (payload['mentee_id']);
          Provider.of<CourseViewModel>(context, listen: false)
              .getEnrolledCourseMentee(mentee, searchKeyword.text, '');
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: MyColor.primary,
          ),
          hintText: titleSearch,
          hintStyle: const TextStyle(
            color: MyColor.primary,
          ),
        ),
      ),
    );
  }
}
