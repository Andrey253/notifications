import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notifications/widgets/main_body.dart';
import 'package:notifications/widgets/menu_button.dart';
import 'dart:html';

/// Entrypoint of the application.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'IT Solutions Management International Pte. Ltd.', home: const HomePage());
  }
}

/// [Widget] displaying the home page consisting of an image the the buttons.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFullScreen = false;
  String imageUrl = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MainBody(onDoubleTap: onDoubleTapOnImage, imageUrl: imageUrl, setUrlImage: setUrlImage, controller: controller),
      floatingActionButton: MenuButton(fullScreen: fullScreen, exitFullscreen: exitFullscreen),
    );
  }

  void onDoubleTapOnImage() async {
    if (kIsWeb) {
      isFullScreen ? exitFullscreen() : fullScreen();
    }
  }

  void setUrlImage() {
    setState(() {
      imageUrl = controller.text;
    });
  }

  void fullScreen() {
    isFullScreen = true;
    document.documentElement?.requestFullscreen();
  }

  exitFullscreen() {
    isFullScreen = false;
    document.exitFullscreen();
  }
}
