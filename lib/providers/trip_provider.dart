import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/trip_repository.dart';
import '../models/trip.dart';

final tripProvider = Provider<List<Trip>>((ref) {
  return TripRepository.getTrips();
});
