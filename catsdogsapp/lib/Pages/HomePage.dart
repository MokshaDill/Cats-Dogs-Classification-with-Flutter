import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late File _image;
  late List _output;
  final picker = ImagePicker();

  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = output!;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'Assets/model_unquant.tflite', labels: 'Assets/labels.txt');
  }

  void dispose() {
    super.dispose();
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path!);
    });

    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path!);
    });

    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Classifier'),
      ),
      body: Column(
        children: [
          if (_image != null) Image.file(_image),
          ElevatedButton(
            onPressed: pickImage,
            child: Text('Pick Image from Camera'),
          ),
          ElevatedButton(
            onPressed: pickGalleryImage,
            child: Text('Pick Image from Gallery'),
          ),
          // Add other UI elements as needed
        ],
      ),
    );
  }
}
