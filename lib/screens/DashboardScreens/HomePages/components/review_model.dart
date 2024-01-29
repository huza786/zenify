class Review {
  final String userName;
  final String userProfilePhoto;
  final String reviewText;
  final int starRating;
  final List<String> photos;
  final DateTime createdAt; // New field for creation time
  final bool hasPhotos; // New field for indicating if the review has photos

  Review({
    required this.userName,
    required this.userProfilePhoto,
    required this.reviewText,
    required this.starRating,
    required this.photos,
    required this.createdAt,
  }) : hasPhotos = photos.isNotEmpty;

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      userName: map['userName'],
      userProfilePhoto: map['userProfilePhoto'],
      reviewText: map['reviewText'],
      starRating: map['starRating'],
      photos: (map['photos'] as List<dynamic>).cast<String>(),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userProfilePhoto': userProfilePhoto,
      'reviewText': reviewText,
      'starRating': starRating,
      'photos': photos,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
