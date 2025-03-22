import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/trip.dart';
import '../data/trip_repository.dart';
import '../widgets/trip_card.dart';

class TripListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trips = TripRepository.getTrips();

    return Scaffold(
      appBar: AppBar(title: Text('Trip List')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine if the screen width is for a mobile or tablet
          bool isTablet = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: isTablet
                ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns for tablet
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 2,
              ),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return TripCard(trip: trips[index]);
              },
            )
                : ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return TripCard(trip: trips[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
