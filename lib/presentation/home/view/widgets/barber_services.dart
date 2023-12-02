import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/infrastructure/model/barber_service_model.dart';
import 'package:looky/presentation/home/cubit/barber_service/barber_service_cubit.dart';
import 'package:shimmer/shimmer.dart';

class BarberServices extends StatelessWidget {
  const BarberServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // call api
      BlocProvider.of<BarberServiceCubit>(context).callBarberServiceDataEvent();

      return BlocBuilder<BarberServiceCubit, BarberServiceState>(
        builder: (context, state) {
          // Loading
          if (state.dataStatus is BarberServiceDataLoading) {
            return _loadingWidget();
          }
          // Completed
          if (state.dataStatus is BarberServiceDataCompleted) {
            BarberServiceDataCompleted dataCompleted =
                state.dataStatus as BarberServiceDataCompleted;

            BarberServiceModel barberServiceModel =
                dataCompleted.barberServiceModel;

            return _completedWidget(barberServiceModel);
          }
          // Error
          if (state.dataStatus is BarberServiceDataError) {
            final BarberServiceDataError dataError =
                state.dataStatus as BarberServiceDataError;

            return _errorWidget(dataError, context);
          }
          return Container();
        },
      );
    });
  }

  Shimmer _loadingWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Column(
              children: [
                Container(
                  width: 25.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: 50.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Row _completedWidget(BarberServiceModel barberServiceModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _barberServiceItem(
          model: barberServiceModel,
          index: 3,
          imagePath: 'assets/images/home/haircut.png',
        ),
        _barberServiceItem(
          model: barberServiceModel,
          index: 2,
          imagePath: 'assets/images/home/face_shave.png',
        ),
        _barberServiceItem(
          model: barberServiceModel,
          index: 0,
          imagePath: 'assets/images/home/skin_fades.png',
        ),
        _barberServiceItem(
          model: barberServiceModel,
          index: 1,
          imagePath: 'assets/images/home/coloring.png',
        ),
      ],
    );
  }

  Column _barberServiceItem({
    required BarberServiceModel model,
    required int index,
    required String imagePath,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: model.results![index].title.toString().toUpperCase() ==
                    'SKIN FADES'
                ? 0.0
                : 8.0,
            bottom: model.results![index].title.toString().toUpperCase() ==
                    'SKIN FADES'
                ? 4.0
                : 8.0,
          ),
          child: Image.asset(imagePath),
        ),
        Text(
          model.results![index].title.toString().toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Container _errorWidget(
      BarberServiceDataError dataError, BuildContext context) {
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
              BlocProvider.of<BarberServiceCubit>(context)
                  .callBarberServiceDataEvent();
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
