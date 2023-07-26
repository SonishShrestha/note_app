import 'package:flutter/material.dart';
import 'package:iphone_notes_app/screens/folderpage.dart';
import 'package:iphone_notes_app/screens/searchpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const boxColor = Color.fromARGB(255, 56, 55, 55);
  static const iconColor = Color.fromARGB(255, 216, 173, 14);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List folderList = [];
  TextEditingController addFolderController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchPage(
                  name: "Folders",
                ),
                const Text("iCloud",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 17)),
                const SizedBox(height: 10),
                Column(
                    children: folderList.map((e) {
                  return FolderPage(folderName: e);
                }).toList()),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.grey,
                                    title: const Text('Add Folder'),
                                    actions: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: HomePage.boxColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Form(
                                          key: formKey,
                                          child: TextFormField(
                                            controller: addFolderController,
                                            decoration: const InputDecoration(
                                              fillColor: HomePage.boxColor,
                                              hintText: 'Add Folder',
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
                                                return "Enter Folder Name";
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
                                              if (formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  folderList.add(
                                                      addFolderController.text);
                                                });
                                                Navigator.pop(context);
                                                addFolderController.clear();
                                              } else {
                                                const Text('Enter Data');
                                              }
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            HomePage.boxColor)),
                                            child: const Text('Add'),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.drive_folder_upload,
                              color: HomePage.iconColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: HomePage.iconColor,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
