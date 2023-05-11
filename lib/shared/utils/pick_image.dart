import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage({
  ImageSource source = ImageSource.gallery,
  double? maxWidth,
  double? maxHeight,
  int? quality = 90,
}) async {
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: source, maxWidth: maxWidth, maxHeight: maxHeight, imageQuality: quality);
    return pickedImage;
  } on Exception catch (e) {
    return null;
  }
}

Future<XFile?> pickVideo({
  ImageSource source = ImageSource.gallery,
  Duration maxDuration = const Duration(minutes: 3),
}) async {
  try {
    final pickedVideo = await ImagePicker().pickVideo(source: source, maxDuration: maxDuration);
    return pickedVideo;
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
