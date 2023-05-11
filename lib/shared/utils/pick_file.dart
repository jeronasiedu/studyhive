import 'dart:io';

import 'package:file_picker/file_picker.dart';

enum FileTypeOption {
  image,
  video,
  document,
}

List<String> getAllowedExtensions(FileTypeOption option) {
  switch (option) {
    case FileTypeOption.image:
      return ['jpg', 'png', 'jpeg'];
    case FileTypeOption.video:
      return ['mp4', 'mov', 'avi'];
    case FileTypeOption.document:
      return ['pdf', 'doc', 'docx'];
  }
}

Future<File?> pickFile({required FileTypeOption option, String dialogTitle = "Choose file"}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: getAllowedExtensions(option),
    dialogTitle: dialogTitle,
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
