import 'package:edu_world/view/home/home_search_screen.dart';
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
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
      child: TextFormField(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeSearchScreen(),
          ));
        },
        showCursor: false,
        decoration: InputDecoration(
          hoverColor: Colors.red,
          filled: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
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
