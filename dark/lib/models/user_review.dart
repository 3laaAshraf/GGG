class UserReview {
  final String userImage;
  final String userName;
  final String reviewContent;
  final double rating;

  const UserReview({
    required this.userImage,
    required this.userName,
    required this.reviewContent,
    required this.rating,
  });

  factory UserReview.fromMap(Map<String, dynamic> map) {
    return UserReview(
      userImage: map['userImage'] ?? '',
      userName: map['userName'] ?? '',
      reviewContent: map['reviewContent'] ?? '',
      rating: (map['rating'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userImage': userImage,
      'userName': userName,
      'reviewContent': reviewContent,
      'rating': rating,
    };
  }
}
