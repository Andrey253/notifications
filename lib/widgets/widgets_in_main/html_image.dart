import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

/// HTML teg img.

class HtmlImg extends StatefulWidget {
  const HtmlImg({super.key, required this.image});
  final String image;

  @override
  State<HtmlImg> createState() => _HtmlImgState();
}

class _HtmlImgState extends State<HtmlImg> {
  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      """<img src="${widget.image}" alt="Изображение не задано" >""",
    );
  }
}
