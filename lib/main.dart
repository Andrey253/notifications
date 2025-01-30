import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notifications/focused.dart';
import 'package:notifications/html_image.dart';
import 'dart:html';

import 'menu.dart';

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
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
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
  GlobalKey buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: GestureDetector(
                            onDoubleTap: pressBotton,
                            child: HtmlImg(
                              image: imageUrl,
                            )))),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'Image URL'),
                  ),
                ),
                ElevatedButton(
                  onPressed: getImage,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: FocusedMenuHolder(
        onPressed: () {},
        menuWidth: 250,
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(title: Text("Enter fullscreen"), trailingIcon: Icon(Icons.fullscreen), onPressed: fullScreen),
          FocusedMenuItem(
              title: Text("Exit fullscreen"), trailingIcon: Icon(Icons.fullscreen_exit), onPressed: exitFullscreen),
        ],
        child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 6, offset: Offset(0, 6), color: Colors.black26)],
             color: const Color.fromARGB(255, 249, 230, 230),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Icon(Icons.add)),
      ),
    );
  }

  void pressBotton() async {
    if (kIsWeb) {
      isFullScreen ? exitFullscreen() : fullScreen();
    }
  }

  exitFullscreen() {
    isFullScreen = false;
    document.exitFullscreen();
  }

  void getImage() {
    setState(() {
      imageUrl = controller.text;
    });
  }

  void fullScreen() {
    isFullScreen = true;
    document.documentElement?.requestFullscreen();
  }
}
