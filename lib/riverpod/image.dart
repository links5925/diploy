import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StateNotifier<File?> {
  ImagePick() : super(null);
  setNull() {
    state = null;
  }

  setData() async {
    File? file;
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      file = File(pickedFile.path);
    }

    state = file;
  }
}

final imagePickProvider = StateNotifierProvider<ImagePick, File?>((ref) {
  return ImagePick();
});
