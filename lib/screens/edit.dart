// import 'package:flutter/material.dart';
// import 'package:image_editor/image_editor.dart';
// import 'dart:io';

// class ImageEditingScreen extends StatefulWidget {
//   final File imageFile;

//   ImageEditingScreen({required this.imageFile});

//   @override
//   _ImageEditingScreenState createState() => _ImageEditingScreenState();
// }

// class _ImageEditingScreenState extends State<ImageEditingScreen> {
//   late File _editedImage;
//   double _rotationAngle = 0.0;
//   bool _isMirrored = false;

//   @override
//   void initState() {
//     super.initState();
//     _editedImage = widget.imageFile;
//   }

//   Future<void> _applyEdits() async {
//     final inputImage = Image.fromFile(widget.imageFile.path);
//     final outputImage = IMG.Image(
//         outputWidth: inputImage.width, outputHeight: inputImage.height);

//     final editor = ImageEditorOption();
//     editor.addOption(RotateOption(_rotationAngle as int));
//     if (_isMirrored) {
//       editor.addOption(FlipOption(horizontal: true));
//     }

//     await ImageEditor.editImage(
//       image: inputImage,
//       // outputImage: outputImage,
//       imageEditorOption: editor,
//     );

//     final editedFile = await outputImage.exportToFile();
//     setState(() {
//       _editedImage = editedFile;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Editing'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.check),
//             onPressed: () {
//               _applyEdits();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Transform(
//                 transform: Matrix4.rotationZ(_rotationAngle)
//                   ..scale(_isMirrored ? -1.0 : 1.0),
//                 alignment: Alignment.center,
//                 child: Image.file(_editedImage),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.rotate_left),
//                 onPressed: () {
//                   setState(() {
//                     _rotationAngle -= 0.1;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.rotate_right),
//                 onPressed: () {
//                   setState(() {
//                     _rotationAngle += 0.1;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.flip),
//                 onPressed: () {
//                   setState(() {
//                     _isMirrored = !_isMirrored;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
