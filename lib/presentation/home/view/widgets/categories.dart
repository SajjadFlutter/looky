import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _categoryItem(
          imagePath: 'assets/images/home/haircut.png',
          title: 'HAIRCUT',
        ),
        _categoryItem(
          imagePath: 'assets/images/home/face_shave.png',
          title: 'FACE SHAVE',
        ),
        _categoryItem(
          imagePath: 'assets/images/home/skin_fades.png',
          title: 'SKIN FADES',
        ),
        _categoryItem(
          imagePath: 'assets/images/home/coloring.png',
          title: 'COLORING',
        ),
      ],
    );
  }

  SizedBox _categoryItem({
    required String imagePath,
    required String title,
  }) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: title == 'SKIN FADES' ? 0.0 : 8.0,
              bottom: title == 'SKIN FADES' ? 4.0 : 8.0,
            ),
            child: Image.asset(imagePath),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
