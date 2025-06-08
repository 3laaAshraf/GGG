import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:dark/models/user_review.dart'; // Import your Places model

class UploadData {
  // Firestore collection reference

  Future<void> submitReview(
      {required String docTitle,
      required UserReview submitData,
      required String type}) async {
    ////////////
    // submit to places if opened places page
    // and to trips if opened trips page
    final CollectionReference placesCollection =
        FirebaseFirestore.instance.collection(type);

    try {
      final reviewData = {
        'userImage': submitData.userImage,
        'userName': submitData.userName,
        'reviewContent': submitData.reviewContent,
        'rating': submitData.rating,
      };

      final querySnapshot = await placesCollection
          .where('title', isEqualTo: docTitle)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception('No place found with title: $docTitle');
      }

      final docId = querySnapshot.docs.first.id;

      // Append the review to the "rating" array field
      await placesCollection.doc(docId).update({
        'rating': FieldValue.arrayUnion([reviewData])
      });

      print("Review added successfully.");
    } catch (e) {
      print('Error uploading review: $e');
      throw Exception('Failed to upload review');
    }
  }
}
