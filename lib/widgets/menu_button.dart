import 'package:flutter/material.dart';
import 'package:notifications/templates/focused_menu_holder.dart';
import 'package:notifications/templates/focused_menu_item.dart';

/// Menu button.

class MenuButton extends StatelessWidget {
  final Function fullScreen;
  
  final Function exitFullscreen;

  const MenuButton({super.key, required this.fullScreen, required this.exitFullscreen});

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
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
      );
  }
}