import 'package:edu_world/view/components/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridCourseShimmer extends StatelessWidget {
  const GridCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade500,
      // period: const Duration(seconds: 5),
      loop: 3,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
          mainAxisExtent: 224,
        ),
        itemBuilder: (context, index) {
          return const Skeleton(height: 120, width: 120);
        },
      ),
    );
  }
}
