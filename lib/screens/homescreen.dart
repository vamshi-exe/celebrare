import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  XFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> _pickImage() async {
    _pickedFile = (await _picker.pickImage(source: ImageSource.gallery));
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
      _showImagePopup();
    }
  }

  _showImagePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottom: false,
      color: Colors.teal,
      child: Scaffold(
        // backgroundColor: Colors.teal,
        appBar: AppBar(
          // elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Add Image / Icon',
            style: GoogleFonts.quintessential(color: Colors.grey),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Upload Image',
                        style:
                            GoogleFonts.amita(fontSize: 19, color: Colors.grey),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(),
                      child: Text(
                        'Choose from Device',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
