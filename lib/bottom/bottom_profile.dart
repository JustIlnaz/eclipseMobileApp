import 'dart:io';

import 'package:eclipse_app/database/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

class BottomProfilePage extends StatefulWidget {
  const BottomProfilePage({super.key});

  @override
  State<BottomProfilePage> createState() => _BottomProfilePageState();
}

class _BottomProfilePageState extends State<BottomProfilePage> {
  XFile? _file;
  File? _selectFile;
  StorageCloud storageCloud = StorageCloud();
  String? url;

  Future<void> selectedImageGallery() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _selectFile = File(returnImage!.path);
      _file = returnImage;
    });
  }

  Future<void> uploadImage() async {
    await storageCloud.addImageCloud(_file!);
  }

  Future<void> downloadUrl() async {
  try {
    final fileName = path.basename(_file!.path);
    final image = Supabase.instance.client.storage
        .from('storage')
        .getPublicUrl(fileName);

    setState(() {
      url = image;
    });
  } catch (e) {
    return;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
