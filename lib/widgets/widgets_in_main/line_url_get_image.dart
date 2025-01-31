import 'package:flutter/material.dart';

/// Image URL input and receive line.

class LineUrlGetImage extends StatelessWidget {
  final TextEditingController controller;
  
  final VoidCallback getImage;

  const LineUrlGetImage({super.key, required this.controller, required this.getImage});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            );
  }
}