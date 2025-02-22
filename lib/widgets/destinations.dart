import 'package:flutter/material.dart';
import 'package:travel_app/models/models.dart';

class DestinationsList extends StatelessWidget {
  final List<Place> places;
  final String apiKey;
  const DestinationsList({
    super.key,
    required this.places,
    required this.apiKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: places.length,
      itemBuilder: (context, index) {
        final item = places[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.antiAlias, // Clips content to the rounded corners
          child: Container(
            height: 100, // Fixed height for consistency
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background image from the API
                Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${item.photoRef}&key=$apiKey',
                  fit: BoxFit.cover,
                ),
                // Semi-transparent overlay using Opacity widget for better text readability
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    color: Colors
                        .black, // Solid color that's made transparent by the Opacity widget
                  ),
                ),
                // Centered title text over the image
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
