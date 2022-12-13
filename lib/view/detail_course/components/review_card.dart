// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:edu_world/models/review_card_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.cardModel,
  }) : super(key: key);
  final ReviewCardModel cardModel;

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
                        image: NetworkImage(cardModel.image!),
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
                      cardModel.name!,
                      style: MyColor().subjudulCourse,
                    ),
                    RatingBarIndicator(
                      rating: cardModel.rating!.toDouble(),
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
              cardModel.reviewText!,
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
