import 'package:app_interview/constants/constants_style.dart';
import 'package:flutter/material.dart';

Text sectionTitle(String text) {
  return Text(
    text,
    style: const TextStyle(fontWeight: fontBold, fontSize: textSizeBody4),
  );
}
