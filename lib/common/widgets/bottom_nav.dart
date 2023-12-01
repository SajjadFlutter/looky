import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looky/common/cubit/change_index_cubit/cubit/change_index_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: BlocBuilder<ChangeIndexCubit, ChangeIndexState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(
                  state: state.index,
                  index: 0,
                  imagePath: 'assets/images/home/home.png'),
              BottomNavItem(
                  state: state.index,
                  index: 1,
                  imagePath: 'assets/images/home/bookmark.png'),
              BottomNavItem(
                  state: state.index,
                  index: 2,
                  imagePath: 'assets/images/home/location_nav.png'),
              BottomNavItem(
                  state: state.index,
                  index: 3,
                  imagePath: 'assets/images/home/user.png'),
            ],
          );
        },
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.state,
    required this.index,
    required this.imagePath,
  });

  final int state;
  final int index;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // change index
        BlocProvider.of<ChangeIndexCubit>(context).changeIndexEvent(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Image.asset(
            imagePath,
            color: state == index ? const Color(0xff1F2A40) : const Color(0xffC7CDD9),
          ),
          const SizedBox(height: 6.0),
          Container(
            width: 6.0,
            height: 6.0,
            decoration: BoxDecoration(
              color: state == index ? const Color(0xff1F2A40) : Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
