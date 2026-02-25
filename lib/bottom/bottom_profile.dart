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
  final user_id = Supabase.instance.client.auth.currentUser!.id;
  dynamic docs;

  Future<void> getUserById() async {
    try {
      var user = await Supabase.instance.client
          .from('users')
          .select()
          .eq('id', user_id).single();

      setState(() {
        docs = user;
      });
    } catch (e) {
      return;
    }
  }

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
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.5,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
                // Добавить с дока пользователей
                child: CircleAvatar(backgroundImage: NetworkImage('avatar')),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text('Имя'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  // controller: emailController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ФИО',
                    fillColor: Colors.white10,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text('Почта'),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  // controller: emailController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Email',
                    fillColor: Colors.white10,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.9,
                child: InkWell(child: Text('Cменить пароль'), onTap: () {}),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromRGBO(223, 213, 235, 100),
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(156, 27, 12, 34),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Сохранить"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
