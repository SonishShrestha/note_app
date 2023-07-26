import 'package:flutter/material.dart';
import 'package:iphone_notes_app/screens/notespage.dart';

class FolderPage extends StatefulWidget {
  final String? folderName;
  // int? totalNotes;
  const FolderPage({super.key, required this.folderName});
  static const primaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const boxColor = Color.fromARGB(255, 56, 55, 55);
  static const iconColor = Color.fromARGB(255, 216, 173, 14);

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: FolderPage.boxColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder_open,
                  color: FolderPage.iconColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "${widget.folderName}",
                  style: const TextStyle(color: FolderPage.primaryColor),
                ),
              ],
            ),
            Row(
              children: [
                // Text("$totalNotes",
                //     style: const TextStyle(color: primaryColor)),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return NotePage(
                          folderName: widget.folderName.toString(),
                        );
                      },
                    ));
                  },
                  icon: const Icon(Icons.arrow_right),
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
