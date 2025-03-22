import 'package:flutter/material.dart';

class TripDashboardWidget {
  static Widget buildSearchBar({
    required TextEditingController searchController,
    required void Function(String) filterItems,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        children: [
          SearchBar(
            controller: searchController,
            onChanged: filterItems,
            leading: const Icon(Icons.search),
            hintText: 'Search items',
          ),
        ],
      ),
    );
  }

  static Widget buildUserCardComponent({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(icon, width: 16, height: 16),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C8D89),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFF141511),
          ),
        ),
      ],
    );
  }

  static Widget buildUserCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 1,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Cameron Williamson'),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserCardComponent(
                    icon: 'assets/icons/ic-coin.png',
                    title: 'My Balance',
                    subtitle: "Rp. 50.000",
                  ),
                  buildUserCardComponent(
                    icon: 'assets/icons/ic-dollar.png',
                    title: 'My Points',
                    subtitle: "Connect now!",
                  ),
                  buildUserCardComponent(
                    icon: 'assets/icons/ic-wallet.png',
                    title: 'Paylater',
                    subtitle: "Activate now! ",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildTicketGroupTile({
    required String icon,
    required String title,
    required String type,
    required Color color,
    required void Function(String) onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap(type),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(icon), scale: 3),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFF141511),
          ),
        ),
      ],
    );
  }

  static Widget buildTicketGroup({required void Function(String) onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTicketGroupTile(
            icon: 'assets/icons/ic-plane.png',
            title: 'Flights',
            color: Color(0xFF1C6AE4),
            type: 'flight',
            onTap: onTap,
          ),
          buildTicketGroupTile(
            icon: 'assets/icons/ic-train.png',
            title: 'Trains',
            color: Color(0xFFFF7A1A),
            type: 'train',
            onTap: onTap,
          ),
          buildTicketGroupTile(
            icon: 'assets/icons/ic-bus.png',
            title: 'Bus',
            color: Color(0xFF7E1DFA),
            type: 'bus',
            onTap: onTap,
          ),
          buildTicketGroupTile(
            icon: 'assets/icons/ic-building.png',
            title: 'Trips',
            color: Color(0xFF1DC5FA),
            type: 'trips',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
