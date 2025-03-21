import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'package:go_router/go_router.dart';

class TripCard extends StatelessWidget {
  const TripCard({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/trip/${trip.id}'),
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                trip.imageUrls.first,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Price: \$${trip.price}',
                      style: TextStyle(fontSize: 16, color: Colors.green)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('${trip.rating}',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
