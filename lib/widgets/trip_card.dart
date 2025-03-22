import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({required this.trip, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/trip/${trip.id}'),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                trip.imageUrls.isNotEmpty ? trip.imageUrls.first : 'https://via.placeholder.com/600x400?text=Trip+Image',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(trip.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${trip.price}', style: TextStyle(fontSize: 16, color: Colors.green)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Text('${trip.rating}'),
                        ],
                      ),
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
