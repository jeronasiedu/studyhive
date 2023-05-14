import 'package:get/get.dart';

import '../../../../shared/utils/pick_file.dart';
import '../../domain/entities/message.dart';

class QuestionsController extends GetxController {
  Rx<QuestionType> questionType = QuestionType.shortAnswer.obs;

  Future<void> chooseImage() async {
    final results = await pickFile(option: FileTypeOption.image, dialogTitle: "Choose Image");
    if (results != null) {}
  }

  Future<void> chooseVideo() async {
    final results = await pickFile(option: FileTypeOption.video, dialogTitle: "Choose Video");
    if (results != null) {}
  }

  Future<void> chooseDocument() async {
    final results = await pickFile(option: FileTypeOption.document, dialogTitle: "Choose Document");
    if (results != null) {}
  }
}
