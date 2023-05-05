import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
  try {
    final pickedImage = await ImagePicker().pickImage(source: source);
    return pickedImage;
  } on Exception catch (e) {
    return null;
  }
}

Future<CroppedFile?> cropImage({
  required String imagePath,
  String? title,
}) async {
  try {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      // make it circular
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title ?? '',
          toolbarColor: Colors.transparent,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: title ?? '',
          aspectRatioLockEnabled: false,
          showCancelConfirmationDialog: true,
        )
      ],
    );
    return croppedImage;
  } on Exception catch (e) {
    return null;
  }
}
