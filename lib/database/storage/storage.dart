import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageCloud {
  final Supabase supabase = Supabase.instance;

  Future<void> addImageCloud(XFile imageFile) async {
    try {
      final fileName = path.basename(imageFile.path);
      await supabase.client.storage
          .from('storage')
          .upload(fileName, File(imageFile.path))
          .then((value) => print("Completed"));
    } catch (e) {
      return;
    }
  }
}
