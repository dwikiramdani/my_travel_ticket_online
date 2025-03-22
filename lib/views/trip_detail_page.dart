import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../data/trip_repository.dart';

class TripDetailPage extends StatelessWidget {
  final String tripId;

  const TripDetailPage({required this.tripId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trip = TripRepository.getTrips().firstWhere((t) => t.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Ensures it navigates back instead of closing
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: trip.imageUrls.length,
                itemBuilder: (context, index) => Image.network(
                  trip.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trip.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Price: \$${trip.price}', style: TextStyle(fontSize: 20, color: Colors.green)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Text('${trip.rating}', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(trip.summary, style: TextStyle(fontSize: 16)),
                  Divider(),
                  Text('Includes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...trip.includes.map((item) => Text('- $item')).toList(),
                  Divider(),
                  Text('Excludes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...trip.excludes.map((item) => Text('- $item')).toList(),
                  Divider(),
                  Text('Terms & Conditions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(trip.terms),
                  Divider(),
                  Text('Total Pax: ${trip.totalPax}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
