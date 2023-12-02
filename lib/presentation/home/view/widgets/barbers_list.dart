import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/infrastructure/model/barber_list_model.dart';
import 'package:looky/presentation/home/cubit/barber_list/barber_list_cubit.dart';
import 'package:looky/presentation/home/cubit/show_filter_cubit/show_filter_cubit.dart';
import 'package:shimmer/shimmer.dart';

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
                                    right: index == filterList.length - 1
                                        ? 0.0
                                        : 8.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 1 || index == 2
                                      ? const Color(0xffAA935F)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Colors.white, width: 0.9),
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
        Builder(builder: (context) {
          // call api for barber list
          BlocProvider.of<BarberListCubit>(context).callBarberListDataEvent();

          return BlocBuilder<BarberListCubit, BarberListState>(
            builder: (context, state) {
              // Loading
              if (state.dataStatus is BarberListDataLoading) {
                return _loadingWidget();
              }
              // Completed
              if (state.dataStatus is BarberListDataCompleted) {
                BarberListDataCompleted dataCompleted =
                    state.dataStatus as BarberListDataCompleted;
                BarberListModel barberListModel = dataCompleted.barberListModel;

                return _completedWidget(barberListModel);
              }
              // Error
              if (state.dataStatus is BarberListDataError) {
                final BarberListDataError dataError =
                    state.dataStatus as BarberListDataError;

                return _errorWidget(dataError, context);
              }
              return Container();
            },
          );
        }),
      ],
    );
  }

  Column _loadingWidget() {
    return Column(
      children: List.generate(8, (index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey)),
              child: const Row(
                children: [
                  ShimmerWidget(width: 90.0, height: 90.0),
                  SizedBox(width: 20.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerWidget(width: 80.0, height: 20.0),
                            SizedBox(width: 5.0),
                            ShimmerWidget(width: 25.0, height: 15.0),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        ShimmerWidget(width: 200.0, height: 15.0),
                        SizedBox(height: 20.0),
                        ShimmerWidget(width: 150.0, height: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        );
      }),
    );
  }

  Column _completedWidget(BarberListModel barberListModel) {
    return Column(
      children: List.generate(
        8,
        (index) {
          return Column(
            children: [
              BarbersItem(
                index: index,
                model: barberListModel,
              ),
              const SizedBox(height: 15.0),
            ],
          );
        },
      ),
    );
  }

  Container _errorWidget(BarberListDataError dataError, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            color: Colors.red,
            size: 26.0,
          ),
          const SizedBox(width: 5.0),
          Text(
            dataError.errorMessage,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          const SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              BlocProvider.of<BarberListCubit>(context)
                  .callBarberListDataEvent();
            },
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: const Color(0xff6440FE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(
                Icons.replay,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Shimmer Item
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}

// Barber Item
class BarbersItem extends StatelessWidget {
  const BarbersItem({
    super.key,
    required this.index,
    required this.model,
  });

  final int index;
  final BarberListModel model;

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
            'assets/images/home/barber_${index + 1}.png',
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
                        Text(
                          model.results[index].fullname,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        index == 0 || index == 1 || index == 2 || index == 5
                            ? Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                    'assets/images/home/purple_tic.png'),
                              )
                            : Container(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star_border_rounded,
                          color: Color(0xffD3BA4C),
                          size: 16.0,
                        ),
                        Text(
                          '${model.results[index].rate}',
                          style: const TextStyle(
                            color: Color(0xffD3BA4C),
                          ),
                        ),
                        const SizedBox(width: 5.0),
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
                    Text(
                      '${model.results[index].distance} Kms',
                      style: const TextStyle(
                        color: Color(0xff6440FE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' | ${model.results[index].address} ...',
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
