// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'dart:async';
import 'dart:io';

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ImageRecognition extends StatefulWidget {
  final double? width;
  final String? imageUrl;
  final Function(String)? onLabelRecognized;

  const ImageRecognition({
    Key? key,
    this.width,
    this.imageUrl,
    this.onLabelRecognized,
  }) : super(key: key);

  @override
  ImageRecognitionState createState() => ImageRecognitionState();
}

class ImageRecognitionState extends State<ImageRecognition> {
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl;
  List? _recognitions;

  @override
  void initState() {
    super.initState();

    _imageUrl = widget.imageUrl;
    loadModel();
    if (_imageUrl != null && _imageUrl != ' ') {
      grabImage();
    }
  }

  @override
  void didUpdateWidget(covariant ImageRecognition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl != oldWidget.imageUrl) {
      _imageUrl = widget.imageUrl;
      if (_imageUrl != null && _imageUrl != ' ') {
        grabImage();
      }
    }
    if (widget.imageUrl == oldWidget.imageUrl) {
      _recognitions = null;
    }
  }

  Future loadModel() async {
    Tflite.close();

    try {
      String? res = await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/labels.txt",
      );

      print("Loaded model:" + res!);
    } catch (e) {
      print("Failed to load model. " + e.toString());
    }
  }

  Future grabImage() async {
    try {
      var response = await http.get(Uri.parse(_imageUrl!));

      if (response.statusCode == 200) {
        var bytes = response.bodyBytes;

        // Get the application documents directory.
        var directory = await getApplicationDocumentsDirectory();

        // Build the path where the image will be saved.
        var path = '${directory.path}/image.jpg';

        // Write the image bytes to the file.
        await File(path).writeAsBytes(bytes);

        await recognizeImage(File(path));
      } else {
        throw Exception('Failed to download image');
      }
    } catch (e) {
      print('Error downloading image: $e');
      // Handle the error. You might want to show a notification, log the error, or even retry the request.
    }
  }

  Future recognizeImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _recognitions = recognitions;
    });

    if (_recognitions != null && _recognitions!.isNotEmpty) {
      String label = _recognitions![0]["label"].split(' ').sublist(1).join(' ');
      if (widget.onLabelRecognized != null) {
        widget.onLabelRecognized!(label);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = [];

    stackChildren.add(Center(
        child: Column(
      children: _recognitions != null
          ? _recognitions!.map((res) {
              String label = res["label"].split(' ').sublist(1).join(' ');
              return Column(
                children: [
                  Text(
                    "$label: ${res["confidence"].toStringAsFixed(3)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        background: Paint()..color = Colors.white),
                  ),
                  if (label == "Normal Superficial")
                    Text(
                      "Cervical cells appear normal at the superficial level. Remember to schedule regular Pap smear screenings to maintain your cervical health.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Normal Intermediate")
                    Text(
                      "Cervical cells appear normal at the intermediate level. Keep up with routine screenings to monitor your cervical health and prevent any abnormalities.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Normal Columnar")
                    Text(
                      "Cervical cells appear normal in their columnar structure. Stay proactive with regular Pap smear tests to ensure continued cervical health.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Dysplastic Light")
                    Text(
                      "Mild dysplasia detected in cervical cells. It's essential to follow up with your healthcare provider for further evaluation and guidance.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Dysplastic Moderate")
                    Text(
                      "Moderate dysplasia detected in cervical cells. Please schedule a follow-up appointment with your doctor for a thorough assessment and potential treatment options.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Dysplastic Severe")
                    Text(
                      "Severe dysplasia detected in cervical cells. Urgent medical attention is needed. Please consult with your healthcare provider promptly for appropriate management.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                  if (label == "Carcinoma")
                    Text(
                      "Carcinoma cells indicating the presence of cervical cancer. Immediate medical intervention is crucial. Please seek guidance from your healthcare provider for comprehensive treatment and support.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          background: Paint()..color = Colors.white),
                    ),
                ],
              );
            }).toList()
          : [
              Text(
                "No image selected. Please upload an image.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    background: Paint()..color = Colors.white),
              )
            ],
    )));

    return Column(children: stackChildren);
  }
}