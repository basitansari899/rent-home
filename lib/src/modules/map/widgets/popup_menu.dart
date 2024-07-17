import 'package:flutter/material.dart';

class CustomPopupMenu extends StatefulWidget {
  final Offset tapPosition;

  const CustomPopupMenu({Key? key, required this.tapPosition}) : super(key: key);

  @override
  _CustomPopupMenuState createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
 late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final menuHeight = 200.0; // Approximate height of the menu
    final menuWidth = 200.0; // Approximate width of the menu

    double topPosition = widget.tapPosition.dy - menuHeight-80;
    if (topPosition < 0) {
      topPosition = 0; // Ensure the menu doesn't go off the top of the screen
    }

    double leftPosition = widget.tapPosition.dx - (menuWidth / 2);
    if (leftPosition < 0) {
      leftPosition = 20; // Ensure the menu doesn't go off the left of the screen
    }
    if (leftPosition + menuWidth > screenWidth) {
      leftPosition = screenWidth - menuWidth; // Ensure the menu doesn't go off the right of the screen
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: leftPosition,
            top: topPosition,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: menuWidth,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomPopupMenuItem(
                        icon: Icons.check_box_outlined,
                        text: 'Cosy areas',
                        onTap: () {
                          Navigator.of(context).pop(1);
                        },
                      ),
                      CustomPopupMenuItem(
                        icon: Icons.wallet,
                        text: 'Price',
                        onTap: () {
                          Navigator.of(context).pop(2);
                        },
                      ),
                      CustomPopupMenuItem(
                        icon: Icons.contact_support,
                        text: 'Infrastructure',
                        onTap: () {
                          Navigator.of(context).pop(3);
                        },
                      ),
                      CustomPopupMenuItem(
                        icon: Icons.layers,
                        text: 'Without any layer',
                        onTap: () {
                          Navigator.of(context).pop(4);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPopupMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomPopupMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}