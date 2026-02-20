import 'package:flutter/material.dart';
import 'package:flutter_loading_screen/models/next_page_param.dart';
import 'package:flutter_loading_screen/widget/loading_screen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  static Future timer() async {
    await Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLoadingScreen(
        title: '',
        loadingMessage: 'Загрузка...',
        styleTextUnderTheLoader: TextStyle(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        futureTask: timer,
        nextPageParam: NextPageParam(navigateToRoute: '/check'),
        image: Image.asset('images/background_logo.png', fit: BoxFit.cover),
        loaderColor: Colors.white,
      ),
    );
  }
}
