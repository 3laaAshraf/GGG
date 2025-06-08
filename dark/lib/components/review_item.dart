import 'package:dark/models/user_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../darkMode_cubit/darkCubit.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.userReview});
  final UserReview userReview;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userReview.userImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userReview.userName,
                  style: TextStyle(
                      color: NewsCubit.get(context).isDark
                          ? const Color(0xFFEEEEEE)
                          : const Color(0xFF115173),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: userReview.rating, // Display the stored rating
                  itemCount: 5,
                  itemSize: 16, // Size of the stars
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color(0xffffc876),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userReview.reviewContent,
              style: TextStyle(
                color: NewsCubit.get(context).isDark
                    ? const Color(0xFFEEEEEE)
                    : const Color(0xFF115173),
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
