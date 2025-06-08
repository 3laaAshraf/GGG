import 'package:dark/components/places_details.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class PlaceItem extends StatelessWidget {
  final Places places;

  const PlaceItem({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PlacesDetails(places: places);
        }));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xffffc876),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 180,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          //alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          image: NetworkImage(places.imageUrl)),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border,
                          color: Color(0xffffc876)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 20,
                  child: Text(
                    places.title,
                    style: TextStyle(
                        color: NewsCubit.get(context).isDark
                            ? Colors.white
                            : const Color(0xFF115173),
                        fontSize: 20),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 20,
                  child: Text(
                    places.price + " EGP",
                    style:
                        const TextStyle(color: Color(0xffffc876), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
