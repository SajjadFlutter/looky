import 'package:flutter/material.dart';

class BarbersList extends StatelessWidget {
  const BarbersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // barbers title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '100 Barber Shop/barbers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 120.0,
              height: 33.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.9),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/home/filter.png',
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5.0),
                  const Text(
                    'Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        // barbers list
        for (int index = 1; index <= 8; index++)
          Column(
            children: [
              BarbersItem(index: index),
              const SizedBox(height: 15.0),
            ],
          ),
      ],
    );
  }
}

class BarbersItem extends StatelessWidget {
  const BarbersItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/home/barber_$index.png',
          ),
          const SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'William Rojer Salon',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        index == 1 || index == 2 || index == 3 || index == 6
                            ? Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                    'assets/images/home/purple_tic.png'),
                              )
                            : Container(),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          color: Color(0xffD3BA4C),
                          size: 16.0,
                        ),
                        Text(
                          '4.1',
                          style: TextStyle(
                            color: Color(0xffD3BA4C),
                          ),
                        ),
                        SizedBox(width: 5.0),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Haircut ,Face Shave ,Skin Fades',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text(
                      '5.0 Kms',
                      style: TextStyle(
                        color: Color(0xff6440FE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' | Pirozzi street, bolvar ...',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
