import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/presentation/home/cubit/show_filter_cubit/show_filter_cubit.dart';

class BarbersList extends StatelessWidget {
  const BarbersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filterList = [
      'Shops',
      'Barbers',
      'Haircut',
      'Face Shave',
      'Skin Fades',
      'Coloring',
    ];

    return Column(
      children: [
        // barbers title
        BlocBuilder<ShowFilterCubit, ShowFilterState>(
          builder: (context, state) {
            return Column(
              children: [
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
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<ShowFilterCubit>(context)
                            .showFilter(!state.showFilter);
                      },
                      child: Container(
                        width: 120.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: state.showFilter
                              ? Colors.white
                              : const Color(0xff1F2A40),
                          border: Border.all(color: Colors.white, width: 0.9),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/home/filter.png',
                              color: state.showFilter
                                  ? const Color(0xff1F2A40)
                                  : Colors.white,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Filters',
                              style: TextStyle(
                                color: state.showFilter
                                    ? const Color(0xff1F2A40)
                                    : Colors.white,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Visibility(
                              visible: state.showFilter,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Color(0xff1F2A40),
                                    fontSize: 17.0,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // barbers filters
                Visibility(
                  visible: state.showFilter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          filterList.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(
                                    right:
                                        index == filterList.length - 1 ? 0.0 : 8.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 1 || index == 2
                                      ? const Color(0xffAA935F)
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: Colors.white, width: 0.9),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Text(
                                  filterList[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight:
                                        index == 0 || index == 1 || index == 2
                                            ? FontWeight.w400
                                            : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ).animate().fade(duration: 200.ms).slide(),
                ),
              ],
            );
          },
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
