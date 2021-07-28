import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String imagePath = "";
  String _fileSize = "";
  
  @override
  void initState() {
    super.initState();
  }

  TextEditingController gunName = TextEditingController();
  TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[800],
      height: 400.0,
      width: 600,
      child: Center(
          child: Card(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 100.0),
                  width: 400,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        _imgFromGallery();
                      },
                      icon: Icon(Icons.image),
                      label: Text("Select Image")),
                ),
                imagePath != ""
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Image.network(imagePath),
                        width: 80,
                        height: 60,
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              width: 400.0,
              child: TextField(
                controller: gunName,
                decoration: InputDecoration(
                  hintText: "Enter Guns\'s name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 400.0,
              child: TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Enter Guns\'s Price",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  width: 400,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        _fileFromStorage();
                      },
                      icon: Icon(Icons.document_scanner_rounded),
                      label: Text("Select Specs")),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("$_fileSize"),
              ],
            ),
          ],
        ),
      )),
    );
  }

  //GETTING IMAGE FROM DISK
  _imgFromGallery() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image!.path;
    });
  }

// GETTING FILE FROM DISK
  _fileFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileSize = file.name.toString();
      });
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      // User canceled the picker
    }
  }
}
