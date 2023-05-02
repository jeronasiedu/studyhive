import 'package:flutter/services.dart';

void copyToClipboard(String text) async {
  ClipboardData data = ClipboardData(text: text);
  await Clipboard.setData(data);
}
