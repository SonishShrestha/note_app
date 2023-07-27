import 'package:flutter/material.dart';
import 'package:iphone_notes_app/model/models.dart';
import 'package:iphone_notes_app/screens/home_page.dart';
import 'package:iphone_notes_app/modules/search_page.dart';

class NotePage extends StatefulWidget {
  final String? folderName;

  const NotePage({super.key, this.folderName});

  @override
  State<NotePage> createState() => _NotePageState();
}

List<AddToDo> addNote = [];

final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
TextEditingController noteController = TextEditingController();
TextEditingController noteEditController = TextEditingController();
const primaryColor = Color.fromRGBO(255, 255, 255, 1);
final date = DateTime.now();
const boxColor = Color.fromARGB(255, 56, 55, 55);
const iconColor = Color.fromARGB(255, 216, 173, 14);

final GlobalKey<FormState> _keyController = GlobalKey<FormState>();

class _NotePageState extends State<NotePage> {
  void addTodo(String todoName) {
    setState(() {
      addNote.add(AddToDo(
          name: todoName,
          id: DateTime.now().millisecondsSinceEpoch.toString()));
    });
  }

  void deleteItem(String id) {
    setState(() {
      addNote.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchPage(
                  name: "Notes",
                ),
                const SizedBox(height: 15),
                Text(
                  'Folder Name : ${widget.folderName}',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Column(
                    children: addNote.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                'Note Created Time : ${date.year}:${date.month}:${date.day}',
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17)),
                            IconButton(
                                onPressed: () {
                                  deleteItem(e.id.toString());
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 222, 115, 107),
                                )),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey,
                                  title: const Text('Edit Notes'),
                                  actions: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: HomePage.boxColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Form(
                                        key: _formKeys,
                                        child: TextFormField(
                                          controller: noteEditController,
                                          decoration: const InputDecoration(
                                            fillColor: HomePage.boxColor,
                                            hintText: 'Edit Notes',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter Edit Data";
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
                                              backgroundColor:
                                                  MaterialStateColor
                                                      .resolveWith((states) =>
                                                          HomePage.boxColor)),
                                          child: const Text('Cancel'),
                                        ),
                                        const SizedBox(width: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            final data =
                                                noteEditController.text;
                                            if (_formKeys.currentState!
                                                .validate()) {
                                              setState(() {
                                                if (e.name!.isNotEmpty) {
                                                  e.name = data;
                                                  noteEditController.clear();
                                                }
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              const Text('Enter Data');
                                            }
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateColor
                                                      .resolveWith((states) =>
                                                          HomePage.boxColor)),
                                          child: const Text('Edit'),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            color: boxColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.name.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()),
              ],
            ),
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
                                  addTodo(noteController.text);
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
