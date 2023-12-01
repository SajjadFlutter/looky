import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorColor: const Color(0xff6440FE),
      decoration: InputDecoration(
        hintText: 'Search in Barbers, Location and servicess ...',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 40.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(color: Color(0xff6440FE), width: 1.0),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: 50.0,
          decoration: BoxDecoration(
            color: const Color(0xff6440FE),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Icon(Icons.search, color: Colors.white,size: 30.0,),
        ),
      ),
    );
  }
}
