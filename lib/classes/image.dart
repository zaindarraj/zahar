import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageBase64 {
  static Uint8List imageFromBase64String(String base) {
    return base64Decode(base);
  }

  static Future<String> baseFromImage(XFile image) async {
    Uint8List bits = await image.readAsBytes();
    String base = base64Encode(bits);
    return base;
  }
}
