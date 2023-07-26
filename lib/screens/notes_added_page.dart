import 'package:flutter/material.dart';

class NotesAddedPage extends StatefulWidget {
  final String noteListName;
  const NotesAddedPage({super.key, required this.noteListName});

  // int? totalNotes;

  @override
  State<NotesAddedPage> createState() => _NotesAddedPageState();
}

class _NotesAddedPageState extends State<NotesAddedPage> {
  static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const boxColor = Color.fromARGB(255, 56, 55, 55);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${date.year}:${date.month}:${date.day}',
              style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 17)),
        ),
        Container(
          color: boxColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.noteListName,
              style: const TextStyle(color: primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
