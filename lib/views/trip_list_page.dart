import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/trip_repository.dart';
import '../widgets/trip_card.dart';

class TripListPage extends HookWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trips = useMemoized(() => TripRepository.getTrips(), []);

    return Scaffold(
      appBar: AppBar(title: Text('Trip List')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(16),
            child:
                isTablet
                    ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 3 / 2,
                          ),
                      itemCount: trips.length,
                      itemBuilder: (context, index) {
                        return TripCard(trip: trips[index]);
                      },
                    )
                    : ListView.separated(
                      itemCount: trips.length,
                      itemBuilder: (context, index) {
                        return TripCard(trip: trips[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 16,
                          thickness: 0,
                          color: Colors.transparent,
                        );
                      },
                    ),
          );
        },
      ),
    );
  }
}
