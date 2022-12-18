import 'package:edu_world/view/components/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListCourseShimmer extends StatelessWidget {
  const ListCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade500,
      loop: 3,
      child: Column(
        children: const [
          Skeleton(height: 50, width: double.maxFinite),
          SizedBox(
            height: 10,
          ),
          Skeleton(height: 50, width: double.maxFinite),
          SizedBox(
            height: 10,
          ),
          Skeleton(height: 50, width: double.maxFinite),
        ],
      ),
    );
  }
}
