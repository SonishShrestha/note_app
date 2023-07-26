import 'package:flutter/material.dart';
import 'package:iphone_notes_app/screens/homepage.dart';
import 'package:iphone_notes_app/screens/notes_added_page.dart';
import 'package:iphone_notes_app/screens/searchpage.dart';

class NotePage extends StatefulWidget {
  final String folderName;
  const NotePage({super.key, required this.folderName});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const boxColor = Color.fromARGB(255, 56, 55, 55);
  static const iconColor = Color.fromARGB(255, 216, 173, 14);
  List noteList = [];
  TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> _keyController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ));
                  },
                  child: const Text(
                    '< Folders',
                    style: TextStyle(color: iconColor),
                  )),
              const SearchPage(
                name: "Notes",
              ),
              const SizedBox(height: 15),
              Column(
                  children: noteList.map((e) {
                return NotesAddedPage(noteListName: e);
              }).toList())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey,
                    title: const Text('Add Notes'),
                    actions: [
                      Container(
                        decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: _keyController,
                          child: TextFormField(
                            controller: noteController,
                            decoration: const InputDecoration(
                              fillColor: boxColor,
                              hintText: 'Add Notes',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Data';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => boxColor)),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_keyController.currentState!.validate()) {
                                setState(() {
                                  noteList.add(noteController.text);
                                });
                                Navigator.pop(context);
                                noteController.clear();
                              } else {}
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => boxColor)),
                            child: const Text('Add'),
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
            backgroundColor: iconColor,
            child: const Icon(Icons.add)),
      ),
    );
  }
}
