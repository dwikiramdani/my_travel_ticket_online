import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_ticket_online/views/trip_dashboard_page.dart';
import 'package:my_travel_ticket_online/views/trip_detail_page.dart';
import 'package:my_travel_ticket_online/views/trip_list_page.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey, // Added for state persistence
  initialLocation: '/', // Keeps last visited page during hot reload
  routes: [
    GoRoute(path: '/', builder: (context, state) => TripDashboardPage()),
    GoRoute(path: '/trip', builder: (context, state) => TripListPage()),
    GoRoute(
      path: '/trip/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return TripDetailPage(tripId: id);
      },
    ),
  ],
);

class TripApp extends HookWidget {
  const TripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trip Booking',
      theme: ThemeData(primarySwatch: Colors.blue),
      restorationScopeId: 'app', // Ensures state is preserved
      routerConfig: _router, // Uses the configured router
    );
  }
}
