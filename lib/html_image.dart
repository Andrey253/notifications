// import 'package:fast_beer/s_api/web/stub.dart'
//     if (dart.library.io) 'package:fast_beer/s_api/web/impl_mobile.dart'
//     if (dart.library.html) 'package:fast_beer/s_api/web/impl_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlImg extends StatefulWidget {
  const HtmlImg({super.key});

  @override
  State<HtmlImg> createState() => _HtmlImgState();
}

class _HtmlImgState extends State<HtmlImg> {
  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      """<!DOCTYPE html>
<body>
    <img src="https://docs.flutter.dev/assets/images/flutter-logo-sharing.png" alt="Логотип компании" >
</body>
</html>""",
    );
  }
}
