import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

import '../widgets/trip_dashboard_widget.dart';

class TripDashboardPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final selectedIndex = useState<int>(0);

    void filterItems(String query) {
      developer.log(query, name: '_filterItems', error: query);
    }

    void handleTransportType(String type) {
      switch (type.toLowerCase()) {
        case "flight":
          print("You selected Flight. Booking a plane ticket...");
          break;
        case "train":
          print("You selected Train. Booking a train ticket...");
          break;
        case "bus":
          print("You selected Bus. Booking a bus ticket...");
          break;
        case "trips":
          print("You selected Trips. Finding tour packages...");
          context.push('/trip');
          break;
        default:
          print(
            "Invalid selection. Please choose Flight, Train, Bus, or Trips.",
          );
      }
    }

    final List<Widget> pages = [
      Column(
        children: [
          TripDashboardWidget.buildSearchBar(
            searchController: searchController,
            filterItems: filterItems,
          ),
          SizedBox(height: 16),
          TripDashboardWidget.buildUserCard(),
          SizedBox(height: 16),
          TripDashboardWidget.buildTicketGroup(onTap: handleTransportType),
        ],
      ),
      Center(child: Text("Search Page")),
      Center(child: Text("Bookings Page")),
      Center(child: Text("Profile Page")),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Color(0xFF1C6AE4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          pages[selectedIndex.value],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) => selectedIndex.value = index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 16,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "My Trip",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
