import 'package:flutter/material.dart';

class NearbyYou extends StatelessWidget {
  const NearbyYou({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 180.0,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/home/nearby_you.png'),
          fit: BoxFit.fitWidth,
        ),
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white,width: 0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.gps_fixed, color: Colors.white),
                    SizedBox(width: 4.0),
                    Text(
                      'Nearby You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                  'Find the nearest Barbar Shop to you on the map',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff6440FE),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text(
                'View the map',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
