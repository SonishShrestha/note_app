import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String name;

  const SearchPage({super.key, required this.name});
  static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const boxColor = Color.fromARGB(255, 56, 55, 55);
  static const iconColor = Color.fromARGB(255, 216, 173, 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: primaryColor),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              fillColor: boxColor,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
