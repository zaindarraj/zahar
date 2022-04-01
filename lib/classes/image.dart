import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';

class ImageBase64 {
  static Uint8List imageFromBase64String(String base) {
    return base64Decode(base);
  }

  
}
