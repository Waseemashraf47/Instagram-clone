import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage (ImageSource) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? file = await _imagePicker.pickImage(source: source);

  if (_file = null){
    return _file.readAsBytes();
  }
}