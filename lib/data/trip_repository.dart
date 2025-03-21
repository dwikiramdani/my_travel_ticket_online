import '../models/trip.dart';

class TripRepository {
  static List<Trip> getTrips() {
    return List.generate(22, (index) => Trip(
      id: '${index + 1}',
      title: 'Trip Destination ${index + 1}',
      imageUrls: ['https://fakeimg.pl/600x400'],
      price: 100 + index * 10,
      rating: 4.0 + (index % 5) * 0.2,
      summary: 'Enjoy an amazing experience at Trip Destination ${index + 1}!',
      includes: ['Hotel', 'Breakfast', 'Transport'],
      excludes: ['Personal expenses', 'Visa fees'],
      terms: 'Cancellation allowed up to 48 hours before departure.',
      totalPax: 5 + (index % 10),
    ));
  }}
