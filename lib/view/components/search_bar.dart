// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:edu_world/utils/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.titleSearch,
  }) : super(key: key);
  final String titleSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: TextFormField(
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
          // prefixIconColor: MyColor.primary,
          hintText: titleSearch,
          hintStyle: const TextStyle(
            color: MyColor.primary,
          ),
        ),
      ),
    );
  }
}
