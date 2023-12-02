import 'package:flutter/material.dart';
import 'package:looky/common/widgets/bottom_nav.dart';
import 'package:looky/presentation/home/view/widgets/info_app.dart';

import 'widgets/barbers_list.dart';
import 'widgets/barber_services.dart';
import 'widgets/nearby_you.dart';
import 'widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size device
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1F2A40),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 120.0,
                    height: 38.0,
                    margin: const EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/home/location_solid.png'),
                        const SizedBox(width: 2.0),
                        Text(
                          'Ranchview',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30.0),
                    const InfoApp(),
                    const SizedBox(height: 30.0),
                    SearchField(controller: _searchController),
                    const SizedBox(height: 20.0),
                    const BarberServices(),
                    const SizedBox(height: 30.0),
                    NearbyYou(width: width),
                    const SizedBox(height: 30.0),
                    const BarbersList(),
                    const SizedBox(height: 30.0),
                    const Text(
                      'Scroll to Load more',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
