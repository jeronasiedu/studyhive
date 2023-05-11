import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/utils/pick_file.dart';

Icon generateFileIcon(FileTypeOption option) {
  switch (option) {
    case FileTypeOption.image:
      return const Icon(IconlyLight.image);
    case FileTypeOption.video:
      return const Icon(IconlyLight.play);
    case FileTypeOption.document:
      return const Icon(IconlyLight.document);
  }
}

Icon generateIconFromExtension(String extension) {
  switch (extension) {
    case 'jpg':
    case 'jpeg':
    case 'png':
      return const Icon(IconlyLight.image);
    case 'mp4':
    case 'mov':
    case 'avi':
      return const Icon(IconlyLight.play);
    case 'pdf':
    case 'doc':
    case 'docx':
      return const Icon(IconlyLight.document);
    default:
      return const Icon(IconlyLight.paper);
  }
}
