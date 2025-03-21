import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_ticket_online/views/trip_detail_page.dart';
import 'package:my_travel_ticket_online/views/trip_list_page.dart';

class TripApp extends StatelessWidget {
  const TripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trip Booking',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => TripListPage()),
          GoRoute(
            path: '/trip/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return TripDetailPage(tripId: id);
            },
          ),
        ],
      ),
    );
  }
}
