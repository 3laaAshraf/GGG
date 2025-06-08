import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:dark/models/user_review.dart'; // Import your Places model

class FetchData {
  // Firestore collection reference
  final CollectionReference placesCollection =
      FirebaseFirestore.instance.collection('places');

  final CollectionReference tripsCollection =
      FirebaseFirestore.instance.collection('trips');

  // Method to fetch places from Firestore
  Future<List<Places>> getPlaces() async {
    try {
      QuerySnapshot querySnapshot = await placesCollection.get();

      List<Places> placesList = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Places(
          imageUrl: data['imageUrl'] ?? '',
          title: data['title'] ?? '',
          price: data['price'] ?? '',
          rating: data['rating'] ?? [],
          description: data['description'] ?? '',
          included: data['included'] ?? '',
          itinerary: data['itinerary'] ?? '',
        );
      }).toList();

      return placesList;
    } catch (e) {
      throw Exception('Error fetching places: $e');
    }
  }

  // Method to fetch trips from Firestore
  Future<List<Places>> getTrips() async {
    try {
      QuerySnapshot querySnapshot = await tripsCollection.get();

      List<Places> tripsList = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Places(
          imageUrl: data['imageUrl'] ?? '',
          title: data['title'] ?? '',
          price: data['price'] ?? '',
          rating: data['rating'] ?? [],
          description: data['description'] ?? '',
          included: data['included'] ?? '',
          itinerary: data['itinerary'] ?? '',
        );
      }).toList();

      return tripsList;
    } catch (e) {
      throw Exception('Error fetching trips: $e');
    }
  }
}
