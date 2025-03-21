import 'package:flutter/material.dart';
import '../data/trip_repository.dart';
import '../widgets/trip_card.dart';

class TripListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trips = TripRepository.getTrips();

    return Scaffold(
      appBar: AppBar(title: Text('Trips')),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return TripCard(trip: trips[index]);
        },
      ),
    );
  }
}
