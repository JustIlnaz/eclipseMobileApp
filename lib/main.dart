import 'package:eclipse_app/registration.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_app/auth.dart';
import 'package:eclipse_app/loading.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: 'sb_publishable_04c-tgofXygYcPlUK1XMAg_4Iq4AAcF',
    url: 'https://cnsitetrangvjpxmwnbh.supabase.co',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {'/': (context) => LoadingPage(),'/auth':(context)=> AuthPage(), '/registration': (context) => RegistrationPage() },
    );
  }
}
