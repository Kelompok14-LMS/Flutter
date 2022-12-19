import 'package:edu_world/models/review_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ReviewModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: data.profilePicture!.isNotEmpty
                            ? NetworkImage(data.profilePicture!)
                            : const NetworkImage(
                                'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.mentee!,
                      style: MyColor().subjudulCourse,
                    ),
                    RatingBarIndicator(
                      rating: data.rating!.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 12,
                      itemCount: 5,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              data.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: MyColor().subjudulCourse,
            )
          ],
        ),
      ),
    );
  }
}
