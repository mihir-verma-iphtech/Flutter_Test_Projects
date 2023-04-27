import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';

class Images extends Notifier<List<File?>> {
  late List<File?> images;

  @override
  build() {
    images = [];
    state = images;
    return state;
  }

  pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.media,
    );
    if (result != null) {
      images = result.paths.map((path) => File(path!)).toList();

      state = images;
    } else {}
    return state;
  }

  getImages() => state;
}

final imagesProvider = NotifierProvider<Images, List<File?>>(
  () => Images(),
);
