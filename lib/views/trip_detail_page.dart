import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../models/trip.dart';
import '../data/trip_repository.dart';

class TripDetailPage extends HookWidget {
  const TripDetailPage({required this.tripId, super.key});

  final String tripId;

  @override
  Widget build(BuildContext context) {
    final trip = useMemoized(
      () => TripRepository.getTrips().firstWhere((t) => t.id == tripId),
      [tripId],
    );

    Widget tripImage() {
      return SizedBox(
        height: 250,
        child: PageView.builder(
          itemCount: trip.imageUrls.length,
          itemBuilder:
              (context, index) => Image.network(
                trip.imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
        ),
      );
    }

    Widget tripTitleInfo() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              trip.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text('${trip.rating}', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Text(trip.summary, style: TextStyle(fontSize: 16)),
          ],
        ),
      );
    }

    Widget tripInclusionInfo() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Includes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...trip.includes.map((item) => Text('- $item')),
          ],
        ),
      );
    }

    Widget tripExclusionInfo() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Excludes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...trip.excludes.map((item) => Text('- $item')),
          ],
        ),
      );
    }

    Widget termAndCondition() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Terms & Conditions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(trip.terms),
          ],
        ),
      );
    }

    Widget tripPax() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          'Total Pax: ${trip.totalPax}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(trip.title)),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tripImage(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tripTitleInfo(),
                    Divider(height: 8, thickness: 4),
                    tripInclusionInfo(),
                    Divider(height: 8, thickness: 4),
                    tripExclusionInfo(),
                    Divider(height: 8, thickness: 4),
                    termAndCondition(),
                    Divider(height: 8, thickness: 4),
                    tripPax(),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp. ${trip.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking trip: ${trip.title}')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
