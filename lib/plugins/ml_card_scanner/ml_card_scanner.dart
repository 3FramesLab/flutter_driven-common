library ml_card_scanner;

import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

part 'src/model/exceptions/scanner_exception.dart';
part 'src/model/card_info.dart';
part 'src/model/card_orientation.dart';
part 'src/model/scanning_params.dart';
part 'src/model/typedefs.dart';

part 'src/utils/camera_resolution.dart';
part 'src/utils/card_parser_util.dart';
part 'src/utils/logger.dart';
part 'src/utils/scanner_widget_controller.dart';
part 'src/utils/string_extension.dart';

part 'src/widget/camera_overlay_widget.dart';
part 'src/widget/camera_preview_wrapper.dart';
part 'src/widget/camera_widget.dart';
part 'src/widget/scanner_overlay_shape.dart';
part 'src/widget/scanner_widget.dart';
